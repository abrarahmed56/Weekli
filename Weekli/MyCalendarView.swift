//
//  MyCalendarView.swift
//  Weekli
//
//  Created by nyuguest on 11/21/17.
//  Copyright © 2017 abrarandpaul. All rights reserved.
//

import UIKit
import JTAppleCalendar

protocol myCalendarViewDelegate: class {
    func passAddEventData(controller: MyCalendarView, name: String, date: String, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int)
}

class MyCalendarView: UIViewController, AddEventViewDelegate {
    let formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = Calendar.current.timeZone
        dateFormatter.locale = Calendar.current.locale
        dateFormatter.dateFormat = "yyyy MM dd"
        return dateFormatter
    }()

    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var eventsListDisplay: UIScrollView!
    @IBAction func post(_ sender: Any) {
    }
    @IBOutlet weak var barButtonPost: UIBarButtonItem!
    
    weak var delegate: myCalendarViewDelegate? = nil
    
    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    
    var eventsList = DayDictionary()
    var eventsFromTheServer: [String:String] = [:]
    var buttonList: [MyEventButton] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let serverObjects = self.getServerEvents()
            for (date, event) in serverObjects {
                let stringDate = self.formatter.string(from: date)
                self.eventsFromTheServer[stringDate] = event
            }
            DispatchQueue.main.async {
                self.calendarView.reloadData()
            }
        }
        
        setUpCalendarView()
        calendarView.scrollToDate( Date() )
        calendarView.selectDates([ Date() ])
        
    }
    
    func setUpCalendarView() {
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
    }
    
    func passEventData(controller: AddEventView, name: String, date: String, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int) {
//        print("data from delegate")
//        print(name)
//        print(date)
//        print(startHour)
//        print(startMinute)
//        print(endHour)
//        print(endMinute)
        delegate?.passAddEventData(controller: self, name: name, date: date, startHour: startHour, startMinute: startMinute, endHour: endHour, endMinute: endMinute)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let addEventView: AddEventView = segue.destination as! AddEventView
        
        addEventView.delegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from:date)
        
        reloadData(day: day, month: month, year: year)
    }
    
    func editBlocks(button1: MyEventButton, button2: MyEventButton) {
        let topOfMovedButton = button1.frame.origin.y
        let bottomOfMovedButton = button1.frame.origin.y + button1.bounds.height
        let topOfOtherButton = button2.frame.origin.y
        let bottomOfOtherButton = button2.frame.origin.y + button2.bounds.height
        // Check top of moved button                // Check top of moved button
        if (topOfMovedButton > topOfOtherButton && topOfMovedButton < bottomOfOtherButton) {
            button1.frame.origin.y = bottomOfOtherButton
        }
        // Check bottom of moved button
        else if (bottomOfMovedButton > topOfOtherButton && bottomOfMovedButton < bottomOfOtherButton ) {
            if ( button2.fixed ) {
                let difference = bottomOfMovedButton - topOfOtherButton
                button1.frame = CGRect(x:button1.frame.origin.x, y: button1.frame.origin.y, width: 300, height: button1.bounds.height - difference)
                let splitButton = MyEventButton.init()
                let hour = Int(button1.frame.origin.y / 60)
                let minute = Int(button1.frame.origin.y) - (hour * 60)
                let duration = Int(button1.bounds.height)
                let titleLabel = String(format: "%2d:%2d, for %d min", hour, minute, duration)
                splitButton.setTitle(titleLabel, for:[])
                splitButton.frame = CGRect(x: 0, y:bottomOfOtherButton, width: 300, height: difference)
                splitButton.id = button1.id
                splitButton.primary = false
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
                splitButton.addGestureRecognizer(panGesture)
                self.eventsListDisplay.addSubview(splitButton)
                buttonList.append(splitButton)
            }
            else {
                button2.frame.origin.y = bottomOfMovedButton
            }
        }
            // Moved block wraps over another block
        else if (bottomOfMovedButton > bottomOfOtherButton && topOfMovedButton < topOfOtherButton ) {
            button2.frame.origin.y = bottomOfMovedButton
        }
        let hour = Int(button1.frame.origin.y / 60)
        let minute = Int(button1.frame.origin.y) - (hour * 60)
        let duration = Int(button1.bounds.height)
        let titleLabel = String(format: "%2d:%2d, for %d min", hour, minute, duration)
        button1.setTitle(titleLabel, for:[])
        
    }
    
    //Button released
    func editTimeOfEvent(view: UIView) {
        var eventEditedForButton = MyEventButton.init()
        for i in 0 ..< buttonList.count {
            if ( view == buttonList[i] ) {
                eventEditedForButton = buttonList[i]
            }
        }
        for i in 0 ..< buttonList.count {
            let currentButton = buttonList[i]
            if ( view != currentButton ) {
                if ( eventEditedForButton.primary ) {
                    eventEditedForButton.primary = false
                    eventEditedForButton.id = Int(arc4random())
                }
                editBlocks(button1: eventEditedForButton, button2: currentButton)
            }
        }

    }
    
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            if ( view.frame.origin.y + translation.y >= 0 &&
                 view.frame.origin.y + translation.y + view.bounds.height <= eventsListDisplay.contentSize.height) {
                view.center = CGPoint(x:view.center.x,
                                  y:view.center.y + translation.y)
            }
        }
        if ( recognizer.state == .ended ) {
            print("button released")
            if let view = recognizer.view {
                editTimeOfEvent(view: view)
            }
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @IBAction func handleTap(recognizer:UITapGestureRecognizer) {
        print("Open menu")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSignOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        self.dismiss(animated: true, completion: nil)
    }
    
    func configureCell(cell: JTAppleCell?, cellState: CellState) {
        //cell configuration here later to shorten code
    }
    
    
    
    func reloadData(day: Int, month: Int, year: Int) {
        for subview in self.eventsListDisplay.subviews {
            if(!subview.isKind(of: UIImageView.self)) {
                subview.removeFromSuperview()
            }
            
        }
        
        let thisDate = eventsList.get(day: day, month: month, year: year)
        if (thisDate != nil) {
        for j in 0 ..< thisDate!.getNumEvents() {
            let raiseButton = MyEventButton.init();
            let hourBegin = thisDate!.todaysEventsDateTimes[j].hour
            let minuteBegin = thisDate!.todaysEventsDateTimes[j].minute
            let duration = thisDate!.todaysEventsTimeElapsed[j]
            // Label displays time and duration of event, later change to show title
            let timeOfEvent = String(format:"%02d:%02d, for %d min", hourBegin!, minuteBegin!, duration)
            //raiseButton.setTitle(thisDate.getDescription(i: j), for: []);
            raiseButton.setTitle(timeOfEvent, for: []);
            
            let timeElapsed = thisDate!.todaysEventsTimeElapsed[j]
            let beginAtHeight = hourBegin!*60 + minuteBegin!
            raiseButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            raiseButton.titleLabel?.font = UIFont(name: "Arial", size: 10)
            raiseButton.frame = CGRect(x: 0, y: 0, width: 300, height: timeElapsed)
            raiseButton.frame.origin.y = CGFloat(beginAtHeight)
            raiseButton.id = Int(arc4random())
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
            raiseButton.addGestureRecognizer(panGesture)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
            raiseButton.addGestureRecognizer(tapGesture)
            buttonList.append(raiseButton)

            eventsListDisplay.contentSize = CGSize(width: 150, height: 1440)
            self.eventsListDisplay.addSubview(raiseButton)
        }
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MyCalendarView: JTAppleCalendarViewDelegate {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!
        let parameters = ConfigurationParameters(startDate:startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 1,
                                                 /*calendar: <#T##Calendar?#>,*/
                                                 generateInDates: .forFirstMonthOnly,
                                                 generateOutDates: .off,
                                                 /*firstDayOfWeek: <#T##DaysOfWeek?#>,*/
                                                 hasStrictBoundaries: false)
        return parameters
    }
    
    
}

extension MyCalendarView: JTAppleCalendarViewDataSource {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        // This function should have the same code as the cellForItemAt function
        let myCustomCell = cell as! CustomCell
        myCustomCell.dateLabel.text = cellState.text
        
        if cellState.isSelected {
            myCustomCell.selectedView.isHidden = false
        }
        else {
            myCustomCell.selectedView.isHidden = true
        }
        
        let todaysDate = Date()
        let todaysDateString = formatter.string(from: todaysDate)
        let monthDateString = formatter.string(from: cellState.date)
        
        if todaysDateString == monthDateString {
            myCustomCell.dateLabel.textColor = UIColor.blue
        } else {
            myCustomCell.dateLabel.textColor = UIColor.white
        }
        
        myCustomCell.eventDotView.isHidden = !eventsFromTheServer.contains {$0.key == formatter.string(from: cellState.date)}
    }
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let myCustomCell = calendar.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        self.calendar(calendar, willDisplay: myCustomCell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        return myCustomCell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let validCell = cell as? CustomCell else { return }
        
        validCell.selectedView.isHidden = false
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from:date)
        
        reloadData(day: day, month: month, year: year)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let validCell = cell as? CustomCell else { return }
        
        validCell.selectedView.isHidden = true
    }
}

extension MyCalendarView {
    func getServerEvents() -> [Date:String] {
        formatter.dateFormat = "yyyy MM dd"
        return [
            formatter.date(from: "2017 12 07")!: "Happy Birthday",
            formatter.date(from: "2017 12 09")!: "Suffering",
            formatter.date(from: "2017 12 10")!: "Pain",
            formatter.date(from: "2017 12 05")!: "Where is Abrar",
            formatter.date(from: "2017 12 02")!: "I need him now",
            formatter.date(from: "2017 12 01")!: "Got it",
            
        ]
    }
}
