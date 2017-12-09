//
//  MyCalendarView.swift
//  Weekli
//
//  Created by nyuguest on 11/21/17.
//  Copyright © 2017 abrarandpaul. All rights reserved.
//

import UIKit
import JTAppleCalendar;

class MyCalendarView: UIViewController {
    let formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = Calendar.current.timeZone
        dateFormatter.locale = Calendar.current.locale
        dateFormatter.dateFormat = "yyyy MM dd"
        return dateFormatter
    }()

    @IBOutlet weak var calendarView: JTAppleCalendarView!
    
    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    
    //let eventsText : NSString? = "blah"
    var eventsList = DayDictionary()
    
    var eventsFromTheServer: [String:String] = [:]

    //@IBOutlet weak var displayEvents: UILabel!
    
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
        
        
        //displayEvents.text = eventsText
        // Do any additional setup after loading the view.
        
    }
    
    func setUpCalendarView() {
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //displayEvents.text = eventsText
        for i in 0 ..< eventsList.size() {
            NSLog("i: %d", i)
        //for i in 0 ..< 1 {
            let thisDate = eventsList.get(i: i)
            for j in 0 ..< thisDate.getNumEvents() {
                let raiseButton = MDCRaisedButton.init();
                //NSLog("hi")
                //NSLog(thisDate.getDescription(i: j))
                raiseButton.setTitle(thisDate.getDescription(i: j), for: []);
                raiseButton.sizeToFit()
                let timeElapsed = thisDate.todaysEventsTimeElapsed[j]
                //NSLog("Time elapsed: %d", timeElapsed)
                raiseButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
                raiseButton.titleLabel?.font = UIFont(name: "Arial", size: 10)
                raiseButton.frame = CGRect(x: 0, y: 0, width: 50, height: timeElapsed)
                raiseButton.frame.origin.y = CGFloat(Float(j)*Float(raiseButton.bounds.height) + 20)
                raiseButton.frame.origin.x = CGFloat(Float(i)*Float(raiseButton.bounds.width))
                //raiseButton.frame.origin.x = CGFloat(Float(i)*10.0)
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
                //panGesture.delegate = self as! UIGestureRecognizerDelegate
                raiseButton.addGestureRecognizer(panGesture)
                /*raiseButton.frame.origin.y = CGFloat(Float(j)*Float(raiseButton.bounds.height))
                raiseButton.frame.origin.x = CGFloat(Float(i)*Float(raiseButton.bounds.width))
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
                //panGesture.delegate = self as! UIGestureRecognizerDelegate
                raiseButton.addGestureRecognizer(panGesture)
                //raiseButton.addTarget(self, action: selector("tapped:"), for: .touchUpInside);*/
                self.view.addSubview(raiseButton);
                
            }
            /*for j in 0 ..< eventsList[thisDate]!.count {
                NSLog("Hi again")
                NSLog(eventsList[i])
                let raiseButton = MDCRaisedButton.init();
                raiseButton.setTitle(eventsDict[thisDate]?[j], for: []);
                raiseButton.sizeToFit()
                /*let buttonWidth = 100;
                let buttonHeight = 500;
                raiseButton.sizeThatFits(CGSize(width: buttonWidth, height: buttonHeight))*/

                raiseButton.frame.origin.y = CGFloat(Float(j)*Float(raiseButton.bounds.height))
                raiseButton.frame.origin.x = CGFloat(Float(i)*Float(raiseButton.bounds.width))
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
                //panGesture.delegate = self as! UIGestureRecognizerDelegate
                raiseButton.addGestureRecognizer(panGesture)
                //raiseButton.addTarget(self, action: selector("tapped:"), for: .touchUpInside);
                self.view.addSubview(raiseButton);
            }*/
        }
        
    }
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        //let translation = recognizer.translation(in: self.view)
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            /*view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)*/
            view.center = CGPoint(x:view.center.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
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
        
//        formatter.dateFormat = "yyyy MM dd"
//        formatter.timeZone = Calendar.current.timeZone
//        formatter.locale = Calendar.current.locale
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!
//        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
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
