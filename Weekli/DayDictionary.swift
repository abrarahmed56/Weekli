//
//  DayDictionary.swift
//  Weekli
//
//  Created by nyuguest on 12/6/17.
//  Copyright © 2017 abrarandpaul. All rights reserved.
//

import UIKit

class DayDictionary: NSObject {
    var dayObjects = [DayObject]()
    func add(desc:String, dateTimeInfo: DateComponents, timeElapsed: Int, day: Int, month: Int, year: Int,
             hour: Int, minute: Int, eventID: String) {
        var currentDay = DayObject()

        var i = 0
        var foundDay = false

        while ( i < dayObjects.count && !foundDay ) {
            currentDay = dayObjects[i]

            if ( currentDay.todaysDay == day &&
                currentDay.todaysMonth == month &&
                currentDay.todaysYear == year ) {
                foundDay = true
            }
            i = i + 1
        }
        if ( foundDay ) {
            currentDay.add(todaysEventDateTime: dateTimeInfo, todaysEventsDescription: desc, todaysEventsTimes: timeElapsed,
                           day: day, month: month, year: year, hour: hour, minute: minute, eventID: eventID)
        }
        else {
            let addDay = DayObject()
            addDay.initWith(todaysEventDateTime: dateTimeInfo, todaysEventsDescription: desc, todaysEventsTimes: timeElapsed,
                            day: day, month: month, year: year, hour: hour, minute: minute, eventID: eventID)
            dayObjects.append(addDay)
        }
    }
    func size() -> Int {
        return dayObjects.count
    }
    func get(i:Int) -> DayObject {
        return dayObjects[i]
    }
    func get(day: Int, month: Int, year: Int) -> DayObject? {
        var currentDay = DayObject()
        var i = 0
        var foundDay = false
        
        while ( i < dayObjects.count && !foundDay ) {
            currentDay = dayObjects[i]
            
            if ( currentDay.todaysDay == day &&
                currentDay.todaysMonth == month &&
                currentDay.todaysYear == year ) {
                foundDay = true
            }
            i = i + 1
        }
        if ( foundDay ) {
            return currentDay
        }
        else {
            return nil
        }
    }
    
    func removeAll() -> Void {
        dayObjects.removeAll()
    }
}
