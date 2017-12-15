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
    @IBOutlet weak var undoButton: UIBarButtonItem!
    
    weak var delegate: myCalendarViewDelegate? = nil
    
    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    
    var eventsList = DayDictionary()
    var eventsFromTheServer: [String:String] = [:]
    var buttonList: [MyEventButton] = []
    var previousStatesList : [[MyEventButton]] = [[]]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let serverObjects = self.getServerEvents()
            for (date, event) in serverObjects {
                let stringDate = self.formatter.string(from: date)
                self.eventsFromTheServer[stringDate] = event
            }
            DispatchQueue.main.async {
                //self.calendarView.reloadData()
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
    
    func placeBlock(button: MyEventButton) {
        print("placing block: ", button.title)
        moveTopToProperSpot(button: button)
        //moveTopOfOthersToProperSpot(button: button, keepSame: true)
        updateLabel(button: button)
        previousStatesList.append(copyOfList(bList: buttonList))
        undoButton.isEnabled = true
    }
    
    
    func moveTopToProperSpot(button: MyEventButton) {
        print("movetop ", button.title)
        combineSplitBlocks()
        //moveTopOfOthersToProperSpot(button: button, keepSame: false)
        //print("handling top of block: " + button.title, buttonList.count)
        var i = 0
        for i in 0 ..< buttonList.count {
            let currentButton = buttonList[i]
            let topOfButton = button.frame.origin.y
            let topOfCurrentButton = currentButton.frame.origin.y
            let bottomOfButton = topOfButton + button.bounds.height
            let bottomOfCurrentButton = topOfCurrentButton + currentButton.bounds.height
            // top of button is inside another button
            if (currentButton != button && (topOfButton >= topOfCurrentButton && topOfButton < bottomOfCurrentButton)) {
                //print("blocks overlap")
                // Block that is overlapped is fixed, move the moved button below the fixed block
                if ( currentButton.fixed ) {
                    
                    button.frame.origin.y = CGFloat(bottomOfCurrentButton)
                    //print("changing block placement")
                    moveTopOfOthersToProperSpot(button: button, keepSame: true)
                    return
                }
                // Block that is overlapped is dynamic, split up the other block to wrap around moved block
                else {
                    let newHeight = topOfButton - topOfCurrentButton
                    let splitHeight = bottomOfCurrentButton - topOfCurrentButton - newHeight
                    currentButton.frame = CGRect(x: currentButton.frame.origin.x, y: currentButton.frame.origin.y, width: 250, height: newHeight)
                    let splitButton = MyEventButton.init()
                    updateLabel(button:currentButton)
                    splitButton.frame = CGRect(x: currentButton.frame.origin.x, y:bottomOfButton, width: 250, height: splitHeight)
                    splitButton.id = currentButton.id
                    splitButton.primary = false
                    splitButton.title = currentButton.title
                    splitButton.backgroundColor = currentButton.backgroundColor
                    splitButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
                    splitButton.titleLabel?.font = UIFont(name: "Arial", size: 10)
                    updateLabel(button: splitButton)

                    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
                    splitButton.addGestureRecognizer(panGesture)

                    self.eventsListDisplay.addSubview(splitButton)
                    buttonList.append(splitButton)
                    //print("split button added (move top)", splitButton.title)
                }
            }
            else {
                //print("blocks don't overlap", currentButton.title)
            }
        }
    }

    func moveTopOfOthersToProperSpot(button: MyEventButton, keepSame: Bool) {
        print("move top of others ", button.title)
        for j in 0 ..< buttonList.count {
            if ( button != buttonList[j] ) {
                let comparingButton = buttonList[j]
                if (button != comparingButton) {
                for i in 0 ..< buttonList.count {
                    let currentButton = buttonList[i]
                    let topOfButton = comparingButton.frame.origin.y
                    let topOfCurrentButton = currentButton.frame.origin.y
                    let bottomOfButton = topOfButton + comparingButton.bounds.height
                    let bottomOfCurrentButton = topOfCurrentButton + currentButton.bounds.height
                    // top of button is inside another button
                    if (currentButton != comparingButton && (topOfButton >= topOfCurrentButton && topOfButton <     bottomOfCurrentButton)) {
                        if ( currentButton.fixed ) {
                            comparingButton.frame.origin.y = CGFloat(bottomOfCurrentButton)
                            //print("changing block placement (others)", comparingButton.title)
                            placeBlock(button: comparingButton)
                        }
                            // Block that is overlapped is dynamic, split up the other block to wrap around moved block
                        else {
                            //if ( keepSame && currentButton == button ) {
                            print("splitting ", button.title)
                            let newHeight = topOfButton - topOfCurrentButton
                            let splitHeight = bottomOfCurrentButton - topOfCurrentButton - newHeight
                            currentButton.frame = CGRect(x: currentButton.frame.origin.x, y: currentButton.frame.origin.y,  width: 250, height: newHeight)
                            let splitButton = MyEventButton.init()
                            updateLabel(button:currentButton)
                            splitButton.frame = CGRect(x: currentButton.frame.origin.x, y:bottomOfButton, width: 250, height: splitHeight)
                            splitButton.id = currentButton.id
                            splitButton.primary = false
                            splitButton.title = currentButton.title
                            splitButton.backgroundColor = currentButton.backgroundColor
                            splitButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
                            splitButton.titleLabel?.font = UIFont(name: "Arial", size: 10)
                            updateLabel(button: splitButton)
                    
                            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
                            splitButton.addGestureRecognizer(panGesture)
                    
                            self.eventsListDisplay.addSubview(splitButton)
                            buttonList.append(splitButton)
                            //print("split button added (move top others)", splitButton.title, comparingButton.title)
                        }
                        //}
    
                    }
                    }
                }
            }
        }
    }
    
    
    // Update label of block to show the name, time, and duration
    func updateLabel(button: MyEventButton) {
        let hour = Int(button.frame.origin.y / 60)
        let minute = Int(button.frame.origin.y) - (hour * 60)
        let duration = Int(button.bounds.height)
        let titleLabel = button.title + String(format: "%02d:%02d, for %d min", hour, minute, duration)
        button.setTitle(titleLabel, for: [])
    }
    
    
    //Button released
    func editTimeOfEvent(view: UIView) {
        var eventEditedForButton = MyEventButton.init()
        for i in 0 ..< buttonList.count {
            if ( view == buttonList[i] ) {
                eventEditedForButton = buttonList[i]
            }
        }
        // If a secondary block was dragged, separate it (now it's primary)
        if (!eventEditedForButton.primary) {
            eventEditedForButton.primary = true
            eventEditedForButton.id = Int(arc4random())
            eventEditedForButton.backgroundColor = getRandomColor()
        }
        //combineSplitBlocks()
        //print("block: ", eventEditedForButton.title, buttonList.count)
        placeBlock(button: eventEditedForButton)
        //print("block: ", eventEditedForButton.title, buttonList.count)
    }
    
    // Combine blocks that were split previously
    func combineSplitBlocks() {
        var index = 0
        while ( index < buttonList.count ) {
            //print("using ", index, " out of ", buttonList.count)
            let button = buttonList[index]
            if ( button.primary ) {
                var totalDuration = button.bounds.height
                var i = 0
                while ( i < buttonList.count ) {
                    if ( button != buttonList[i] && !buttonList[i].primary && buttonList[i].id == button.id ) {
                        totalDuration = totalDuration + buttonList[i].bounds.height
                        buttonList[i].removeFromSuperview()
                        buttonList.remove(at: i)
                        i -= 1
                        index = index - 1
                    }
                    i = i + 1
                }
                button.frame = CGRect(x: button.frame.origin.x, y: button.frame.origin.y, width: 250, height: totalDuration)
            }
            else {
                button.primary = true
                button.id = Int(arc4random())
            }
            index = index + 1
            if ( index < 0 ) {
                index = 0
            }
        }
    }
    

    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            eventsListDisplay.bringSubview(toFront: view)
            if ( view.frame.origin.y + translation.y >= 0 &&
                 view.frame.origin.y + translation.y + view.bounds.height <= eventsListDisplay.contentSize.height) {
                view.center = CGPoint(x:view.center.x,
                                  y:view.center.y + translation.y)
            }
        }
        if ( recognizer.state == .ended ) {
            //print("button released")
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
    
    func getRandomColor() -> UIColor {
        let redVal = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let greenVal = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let blueVal = CGFloat(arc4random()) / CGFloat(UInt32.max)
        return UIColor(red: redVal, green: greenVal, blue: blueVal, alpha: 1.0)
    }
    
    func getPreviousState() -> [MyEventButton]? {
        if ( previousStatesList.count > 0 ) {
            return previousStatesList.removeLast()
        }
        else {
            return nil
        }
    }
    
    
    func reloadData(day: Int, month: Int, year: Int) {
        previousStatesList = [[]]
        undoButton.isEnabled = false
        clearEvents()
        eventsListDisplay.contentSize = CGSize(width: eventsListDisplay.contentSize.width, height: 1440)

        let thisDate = eventsList.get(day: day, month: month, year: year)
        if (thisDate != nil) {
            for j in 0 ..< thisDate!.getNumEvents() {
                let raiseButton = MyEventButton.init();
                raiseButton.backgroundColor = getRandomColor()
                let hourBegin = thisDate!.todaysEventsDateTimes[j].hour
                let minuteBegin = thisDate!.todaysEventsDateTimes[j].minute
                let duration = thisDate!.todaysEventsTimeElapsed[j]
                let eventName = thisDate!.getDescription(i: j)
                // Label displays time and duration of event, later change to show title
                let timeOfEvent = String(format:"%02d:%02d, for %d min", hourBegin!, minuteBegin!, duration)
                raiseButton.setTitle(eventName + timeOfEvent, for: []);
            
                let timeElapsed = thisDate!.todaysEventsTimeElapsed[j]
                let beginAtHeight = hourBegin!*60 + minuteBegin!
                raiseButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
                raiseButton.titleLabel?.font = UIFont(name: "Arial", size: 10)
                raiseButton.frame = CGRect(x: 0, y: 0, width: 250, height: timeElapsed)
                raiseButton.frame.origin.y = CGFloat(beginAtHeight)
                raiseButton.id = Int(arc4random())
                raiseButton.title = thisDate!.todaysEventsDescriptions[j]
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
                raiseButton.addGestureRecognizer(panGesture)
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
                raiseButton.addGestureRecognizer(tapGesture)
                buttonList.append(raiseButton)

                self.eventsListDisplay.addSubview(raiseButton)
            }
        }
        //previousStatesList.append(buttonList)
    }

    @IBAction func undoAction(_ sender: Any) {
        print("pressed undo")
        let undidButtonList = getPreviousState()
        if ( undidButtonList != nil ) {
            print("not nil")
            buttonList = undidButtonList!
            clearEvents()
            showEventsFromButtons(newButtonList: undidButtonList!)
        }
        if ( previousStatesList.count <= 0 ) {
            undoButton.isEnabled = false
        }
    }
    
    @IBAction func clearEvents() {
        for subview in self.eventsListDisplay.subviews {
            if(!subview.isKind(of: UIImageView.self)) {
                subview.removeFromSuperview()
            }
        }
        addHorizontalHourIndicators()
    }
    
    func showEventsFromButtons(newButtonList: [MyEventButton]) {
        print("show events from buttons")
        for button in newButtonList {
            print("showing an event from buttons")
            print(button.frame.origin.y)
            self.eventsListDisplay.addSubview(button)
        }
    }
    
    func addHorizontalHourIndicators() {
        for i in 0 ..< 24 {
            let horizontalLine = UIView()
            horizontalLine.backgroundColor = UIColor.black
            horizontalLine.frame = CGRect(x: 0, y: i*60, width: 300, height: 1)
            self.eventsListDisplay.addSubview(horizontalLine)
        }
    }
    
    func copyOfList(bList: [MyEventButton]) -> [MyEventButton] {
        var returnList : [MyEventButton] = []
        for button in bList {
            let newButton = MyEventButton.init(frame: CGRect(x: button.frame.origin.x, y: button.frame.origin.y, width: 300, height: button.frame.origin.y + button.bounds.height))
            //let newButton = button.copy()
            returnList.append(newButton)
        }
        return returnList
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
