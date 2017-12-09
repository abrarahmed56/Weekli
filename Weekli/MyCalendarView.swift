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
    let formatter = DateFormatter()

    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    
    //let eventsText : NSString? = "blah"
    var eventsList = DayDictionary()

    //@IBOutlet weak var displayEvents: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //displayEvents.text = eventsText
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //displayEvents.text = eventsText
        //for i in 0 ..< eventsList.size() {
        for i in 0 ..< 1 {
            let thisDate = eventsList.get(i: i)
            for j in 0 ..< thisDate.getNumEvents() {
                let raiseButton = MDCRaisedButton.init();
                NSLog("hi")
                NSLog(thisDate.getDescription(i: j))
                raiseButton.setTitle(thisDate.getDescription(i: j), for: []);
                raiseButton.sizeToFit()
                raiseButton.frame.origin.y = CGFloat(Float(j)*Float(raiseButton.bounds.height))
                raiseButton.frame.origin.x = CGFloat(Float(i)*Float(raiseButton.bounds.width))
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
                //panGesture.delegate = self as! UIGestureRecognizerDelegate
                raiseButton.addGestureRecognizer(panGesture)
                //raiseButton.addTarget(self, action: selector("tapped:"), for: .touchUpInside);
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MyCalendarView: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        // This function should have the same code as the cellForItemAt function
        let myCustomCell = cell as! CustomCell
        myCustomCell.dateLabel.text = cellState.text
        // sharedFunctionToConfigureCell(myCustomCell: myCustomCell, cellState: cellState, date: date)
    }
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let myCustomCell = calendar.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        self.calendar(calendar, willDisplay: myCustomCell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        return myCustomCell
    }
}
