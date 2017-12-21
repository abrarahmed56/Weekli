//
//  self.swift
//  Weekli
//
//  Created by nyuguest on 12/20/17.
//  Copyright © 2017 abrarandpaul. All rights reserved.
//

import UIKit

class AddBlockView: UIView {
    
    var name : String = ""
    var numHours : Int = 0
    var numMinutes : Int = 0
    
    init() {
        super.init(frame: CGRect(x: 30, y: 100, width: 250, height: 400))
    
    let finishButton = MDCRaisedButton.init()
    finishButton.backgroundColor = UIColor.gray
    finishButton.frame = CGRect(x: 50, y: 340, width: 150, height: 50)
    finishButton.setTitle("Create Event", for: [])
    let name = "A"
    let numHours = 3
    let numMinutes = 15
    finishButton.addTarget(self, action: #selector(MyCalendarView.addBlockToCalendar), for: .touchUpInside)
    //finishButton.addTarget(self, action: #selector(MyCalendarView.closeAddingBlockView), for: .touchUpInside)
    self.backgroundColor = UIColor.white
    self.addSubview(finishButton)
    
    let askName = UILabel.init()
    askName.frame = CGRect(x: 5, y: 10, width: 50, height: 50)
    askName.text = "Name:"
    
    let answerName = UITextField.init()
    answerName.frame = CGRect(x: 70, y: 10, width: 170, height: 50)
    answerName.borderStyle = UITextBorderStyle.roundedRect
    
    let askDuration = UILabel.init()
    askDuration.frame = CGRect(x: 5, y: 80, width: 70, height: 50)
    askDuration.text = "Duration:"
    
    let answerDurationHours = UITextField.init()
    answerDurationHours.borderStyle = UITextBorderStyle.roundedRect
    answerDurationHours.frame = CGRect(x: 80, y: 80, width: 35, height: 50)
    let answerDurationHoursLabel = UILabel.init()
    answerDurationHoursLabel.frame = CGRect(x: 120, y: 80, width: 50, height: 50)
    answerDurationHoursLabel.text = "hours"
    
    let answerDurationMinutes = UITextField.init()
    answerDurationMinutes.borderStyle = UITextBorderStyle.roundedRect
    answerDurationMinutes.frame = CGRect(x: 170, y: 80, width: 35, height: 50)
    let answerDurationMinutesLabel = UILabel.init()
    answerDurationMinutesLabel.frame = CGRect(x: 210, y: 80, width: 50, height: 50)
    answerDurationMinutesLabel.text = "min"
    
    
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


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
