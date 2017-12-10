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
    var todaysMonth : Int = 0
    var todaysDay : Int = 0
    var todaysYear : Int = 0
    var todaysEventsDateTimes : [DateComponents] = []
    var todaysEventsDescriptions : [String] = []
    var todaysEventsTimeElapsed : [Int] = []
    private var numEvents = 0
    func initWith(todaysEventDateTime:DateComponents, todaysEventsDescription: String, todaysEventsTimes: Int,
                  day: Int, month: Int, year: Int, hour: Int, minute: Int) {
        todaysEventsDateTimes = [todaysEventDateTime]
        todaysEventsDescriptions = [todaysEventsDescription]
        todaysEventsTimeElapsed = [todaysEventsTimes]
        if (todaysEventDateTime.date != nil) {
            todaysDate = todaysEventDateTime.date!
        }
        todaysMonth = month
        todaysYear = year
        todaysDay = day
        numEvents = 1
    }
    func add(todaysEventDateTime: DateComponents, todaysEventsDescription: String, todaysEventsTimes: Int,
             day: Int, month: Int, year: Int, hour: Int, minute: Int) {
        todaysDay = day
        todaysMonth = month
        todaysYear = year
        todaysEventsDateTimes.append(todaysEventDateTime)
        todaysEventsDescriptions.append(todaysEventsDescription)
        todaysEventsTimeElapsed.append(todaysEventsTimes)
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
