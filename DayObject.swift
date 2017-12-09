//
//  DayObject.swift
//  Weekli
//
//  Created by nyuguest on 12/6/17.
//  Copyright © 2017 abrarandpaul. All rights reserved.
//

import UIKit

class DayObject: NSObject {
    var todaysDate = Date()
    var todaysEventsDateTimes : [DateComponents] = []
    var todaysEventsDescriptions : [String] = []
    private var numEvents = 0
    func initWith(todaysEventDateTime: DateComponents, todaysEventsDescription: String) {
        NSLog(todaysEventDateTime.description)
        NSLog(todaysEventsDescription)
        todaysEventsDateTimes = [todaysEventDateTime]
        todaysEventsDescriptions = [todaysEventsDescription]
        if (todaysEventDateTime.date != nil) {
            todaysDate = todaysEventDateTime.date!
        }
        numEvents = 1
    }
    func add(todaysEventDateTime: DateComponents, todaysEventsDescription: String) {
        todaysEventsDateTimes.append(todaysEventDateTime)
        todaysEventsDescriptions.append(todaysEventsDescription)
        numEvents = numEvents + 1
    }
    func getNumEvents() -> Int {
        return numEvents
    }
    func getDateComponent(i:Int) -> DateComponents {
        return todaysEventsDateTimes[i]
    }
    func getDescription(i:Int) -> String {
        return todaysEventsDescriptions[i]
    }
}
