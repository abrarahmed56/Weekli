//
//  MyEventButton.swift
//  Weekli
//
//  Created by nyuguest on 12/10/17.
//  Copyright © 2017 abrarandpaul. All rights reserved.
//

import UIKit

class MyEventButton: MDCRaisedButton {

    // id keeps track of split events which are technically the same event
    var id : Int = 0
    
    // primary keeps track of the first event in a split so the events stay together
    // if a secondary block is moved, the events are separated
    var primary : Bool = true
    
    // fixed blocks cannot be moved, 1
    // dynamic blocks are wrapped around fixed blocks, -1
    var fixed : Int = 0
    
    var title: String = ""
    
    func myCopy() -> MyEventButton {
        let button = self
        let returnButton = MyEventButton.init()
        returnButton.frame = button.frame
        returnButton.backgroundColor = button.backgroundColor
        returnButton.title = button.title
        returnButton.updateLabel()
        returnButton.id = self.id
        returnButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        returnButton.titleLabel?.font = UIFont(name: "Arial", size: 10)
        returnButton.primary = self.primary

        return returnButton
    }
    
    // Update label of block to show the name, time, and duration
    func updateLabel() {
        let hour = Int(self.frame.origin.y / 60)
        let minute = Int(self.frame.origin.y) - (hour * 60)
        let duration = Int(self.bounds.height)
        let titleLabel = self.title + String(format: "%02d:%02d, for %d min", hour, minute, duration)
        self.setTitle(titleLabel, for: [])
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
