//
//  self.swift
//  Weekli
//
//  Created by nyuguest on 12/20/17.
//  Copyright © 2017 abrarandpaul. All rights reserved.
//

import UIKit

protocol AddBlockDelegate: class {
    func addBlockToCalendar(name: String, numHours: Int, numMinutes: Int)
}

class AddBlockView: UIView {
    
    var nameInput : UITextField? = nil
    var numHoursInput : UITextField? = nil
    var numMinutesInput : UITextField? = nil
    weak var delegate : AddBlockDelegate? = nil
    
    init() {
        super.init(frame: CGRect(x: 15, y: 0, width: 250, height: 350))
    
    let finishButton = MDCRaisedButton.init()
    finishButton.backgroundColor = UIColor.gray
    finishButton.frame = CGRect(x: 50, y: 290, width: 150, height: 50)
    finishButton.setTitle("Create Event", for: [])
    let name = "A"
    let numHours = 3
    let numMinutes = 15
    finishButton.addTarget(self, action: #selector(AddBlockView.showBlock), for: .touchUpInside)
    //finishButton.addTarget(self, action: #selector(MyCalendarView.closeAddingBlockView), for: .touchUpInside)
    self.backgroundColor = UIColor.white
    self.addSubview(finishButton)
    
    let askName = UILabel.init()
    askName.frame = CGRect(x: 5, y: 10, width: 50, height: 50)
    askName.text = "Name:"
    
    let answerName = UITextField.init()
    answerName.frame = CGRect(x: 70, y: 10, width: 170, height: 50)
    answerName.borderStyle = UITextBorderStyle.roundedRect
        nameInput = answerName
    
    let askDuration = UILabel.init()
    askDuration.frame = CGRect(x: 5, y: 80, width: 70, height: 50)
    askDuration.text = "Duration:"
    
    let answerDurationHours = UITextField.init()
    answerDurationHours.borderStyle = UITextBorderStyle.roundedRect
    answerDurationHours.frame = CGRect(x: 80, y: 80, width: 35, height: 50)
    let answerDurationHoursLabel = UILabel.init()
    answerDurationHoursLabel.frame = CGRect(x: 120, y: 80, width: 50, height: 50)
    answerDurationHoursLabel.text = "hours"
        numHoursInput = answerDurationHours
    
    let answerDurationMinutes = UITextField.init()
    answerDurationMinutes.borderStyle = UITextBorderStyle.roundedRect
    answerDurationMinutes.frame = CGRect(x: 170, y: 80, width: 35, height: 50)
    let answerDurationMinutesLabel = UILabel.init()
    answerDurationMinutesLabel.frame = CGRect(x: 210, y: 80, width: 50, height: 50)
    answerDurationMinutesLabel.text = "min"
        numMinutesInput = answerDurationMinutes
    
    
    self.addSubview(askName)
    self.addSubview(answerName)
    self.addSubview(askDuration)
    self.addSubview(answerDurationHours)
    self.addSubview(answerDurationHoursLabel)
    self.addSubview(answerDurationMinutes)
    self.addSubview(answerDurationMinutesLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showBlock() {
        let name = (nameInput?.text)!
        let numHoursText = numHoursInput?.text
        let numHours = Int(numHoursText!)
        let numMinutesText = numMinutesInput?.text
        let numMinutes = Int(numMinutesText!)
        
        
        /*raiseButton.backgroundColor = getRandomColor()
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
        raiseButton.frame = CGRect(x: 0, y: 0, width: 230, height: timeElapsed)
        raiseButton.frame.origin.y = CGFloat(beginAtHeight)
        raiseButton.id = Int(arc4random())
        raiseButton.title = thisDate!.todaysEventsDescriptions[j]*/
        //raiseButton.new = true

        /*addPanGestureRecognizer(button: raiseButton)
        //             let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        let tapGesture = EventTapGestureRecognizer(target: self, action: #selector(tapped(gestureRecognizer:)))
        tapGesture.eventID = raiseButton.googleEventID
        raiseButton.addGestureRecognizer(tapGesture)
        buttonList.append(raiseButton)
        
        self.eventsListDisplay.addSubview(raiseButton)*/

        delegate?.addBlockToCalendar(name: name, numHours: numHours!, numMinutes: numMinutes!/*, block: raiseButton*/)
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
