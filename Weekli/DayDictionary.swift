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
    func add(desc:String, dateTimeInfo: DateComponents) {
        var currentDay : DayObject
        if ( dayObjects.count > 0 ) {
            currentDay = dayObjects[0]
        }
        else {
            currentDay = DayObject.init()
            currentDay.initWith(todaysEventDateTime: dateTimeInfo, todaysEventsDescription: desc)
        }
        var i = 0
        var foundDay = false
        //for i in 0 ..< dayObjects.count {
        while ( i < dayObjects.count && !foundDay ) {
            currentDay = dayObjects[i]
            if ( currentDay.todaysDate == dateTimeInfo.date ) {
                foundDay = true
            }
            i = i + 1
        }
        if ( foundDay ) {
            currentDay.add(todaysEventDateTime: dateTimeInfo, todaysEventsDescription: desc)
        }
        else {
            let addDay = DayObject()
            addDay.initWith(todaysEventDateTime: dateTimeInfo, todaysEventsDescription: desc)
            dayObjects.append(addDay)
        }
    }
    func size() -> Int {
        return dayObjects.count
    }
    func get(i:Int) -> DayObject {
        return dayObjects[i]
    }
}
