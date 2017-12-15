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
    
    // fixed blocks cannot be moved
    // dynamic blocks are wrapped around fixed blocks
    var fixed : Bool = false
    
    var title: String = ""
    
    func myCopy() -> MyEventButton {
        let button = self
        let returnButton = MyEventButton.init()
        returnButton.frame = button.frame
        returnButton.backgroundColor = button.backgroundColor
        returnButton.title = button.title
        returnButton.setTitle(String(describing: button.titleLabel), for: [])
        return returnButton
    }
    
    func updateLabel() {
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
