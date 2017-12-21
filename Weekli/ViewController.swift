//
//  ViewController.swift
//  Weekli
//
//  Created by nyuguest on 11/18/17.
//  Copyright © 2017 abrarandpaul. All rights reserved.
//


import UIKit

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate, myCalendarViewDelegate {
    
    
    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    private let scopes = [kGTLRAuthScopeCalendar]
    private let service = GTLRCalendarService()

    var eventsList = DayDictionary()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().signOut()
        
        // Configure Google Sign-in.
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().scopes = scopes
        GIDSignIn.sharedInstance().signInSilently()
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            showAlert(title: "Authentication Error", message: error.localizedDescription)
            self.service.authorizer = nil
        } else {
            self.service.authorizer = user.authentication.fetcherAuthorizer()
            fetchEvents()
        }
    }
    
    func passDeleteData(controller: MyCalendarView, eventID: String) {
        print("eventID in ViewController", eventID)
        
        let googleUser = GIDSignIn.sharedInstance().currentUser
        let service: GTLRCalendarService = GTLRCalendarService()
        if(googleUser?.authentication != nil) {
            let query:GTLRCalendarQuery_EventsDelete = GTLRCalendarQuery_EventsDelete.query(withCalendarId: "primary", eventId: eventID)
            service.authorizer = googleUser!.authentication.fetcherAuthorizer()
            service.executeQuery(query, completionHandler: {(ticket:GTLRServiceTicket?, object: Any?, error: Error?)->Void in
                print("executed query")
                if error == nil {
                    print("deleted")
                }
                else {
                    print("add failed")
                    print(error)
                }
                
                } as? GTLRServiceCompletionHandler)
        }
        
    }
    
    func passEditEventData(controller: MyCalendarView, buttonList: [MyEventButton], day: Int, month: Int, year: Int) {
        for button in buttonList {
            //if ( button.new ) {
                let startHour = Int(button.frame.origin.y / 60)
                let startMinute = Int(button.frame.origin.y) - (startHour*60)
                let endHour = Int((button.frame.origin.y + button.bounds.height) / 60)
                let endMinute = Int(button.frame.origin.y + button.bounds.height) - (endHour*60)
                //print(startHour)
                //print(startMinute)
                //print(endHour)
                //print(endMinute)
                
                var startComponents = DateComponents()
                startComponents.day = day
                startComponents.month = month
                startComponents.year = year
                startComponents.hour = startHour
                startComponents.minute = startMinute
                
                var endComponents = DateComponents()
                endComponents.day = day
                endComponents.month = month
                endComponents.year = year
                endComponents.hour = endHour
                endComponents.minute = endMinute
                
                let userCalendar = Calendar.current
                let startTimeObject = userCalendar.date(from: startComponents)
                let endTimeObject = userCalendar.date(from: endComponents)
                let googleUser = GIDSignIn.sharedInstance().currentUser
                
                if ( googleUser?.authentication != nil) {
                    print("adding event")
                    print(button.title)
                    let newEvent: GTLRCalendar_Event = GTLRCalendar_Event()
                    newEvent.summary = button.title
                    
                    //set GTLRDateTimes
                    let startTime: GTLRDateTime = GTLRDateTime(date: startTimeObject!)
                    let googleStartTime = GTLRCalendar_EventDateTime.init()
                    googleStartTime.dateTime = startTime
                    
                    let endTime: GTLRDateTime = GTLRDateTime(date: endTimeObject!)
                    let googleEndTime = GTLRCalendar_EventDateTime.init()
                    googleEndTime.dateTime = endTime
                    
                    newEvent.start = googleStartTime
                    newEvent.end = googleEndTime
                    
                    let service: GTLRCalendarService = GTLRCalendarService()

                    if ( button.new ) {
                    let query:GTLRCalendarQuery_EventsInsert = GTLRCalendarQuery_EventsInsert.query(withObject: newEvent, calendarId:"primary")

                    service.authorizer = googleUser!.authentication.fetcherAuthorizer()
                    service.executeQuery(query, completionHandler: {(ticket:GTLRServiceTicket?, object: Any?, error: Error?)->Void in
                        print("executed query")
                        if error == nil {
                            print("added")
                        }
                        else {
                            print("add failed")
                            print(error)
                        }
                        
                        } as? GTLRServiceCompletionHandler)
                    }
                    else {
                        print("else")
                        let query:GTLRCalendarQuery_EventsPatch = GTLRCalendarQuery_EventsPatch.query(withObject: newEvent, calendarId: "primary", eventId: button.googleEventID)
                        service.authorizer = googleUser!.authentication.fetcherAuthorizer()
                        service.executeQuery(query, completionHandler: {(ticket: GTLRServiceTicket?, object: Any?, error: Error?) -> Void in
                            print("executed query")
                            if ( error == nil ) {
                                print("updated")
                            }
                            else {
                                print("update failed")
                                print(error)
                            }
                        } as? GTLRServiceCompletionHandler)
                    }
                }
            //}
            //else {
                
            //}
        }
    }
    
    func passAddEventData(controller: MyCalendarView, name: String, date: String, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int) {
        print("data from view controller delegate")
        var dateArr = date.components(separatedBy: " ")[0].components(separatedBy: "-")
        var day:Int? = Int(dateArr[2])
        var month:Int? = Int(dateArr[1])
        var year:Int? = Int(dateArr[0])
        
        //print(date.components(separatedBy: " "))
        //print("date:", dateArr[0].components(separatedBy: "-"))
        
        //Set date objects for start and end
        var startComponents = DateComponents()
        startComponents.day = day
        startComponents.month = month
        startComponents.year = year
        startComponents.hour = startHour
        startComponents.minute = startMinute
        print(startComponents.day!)
        print(startComponents.month!)
        print(startComponents.year!)
        print(startComponents.hour!)
        print(startComponents.minute!)
        var endComponents = DateComponents()
        // startComponenets.date = date
        endComponents.day = day
        endComponents.month = month
        endComponents.year = year
        endComponents.hour = endHour
        endComponents.minute = endMinute
        
        let userCalendar = Calendar.current // user calendar
        let startTimeObject = userCalendar.date(from: startComponents)
        print("startTimeObject", startTimeObject)
        let endTimeObject = userCalendar.date(from: endComponents)
        print("endTimeObject", endTimeObject)
        
        let googleUser = GIDSignIn.sharedInstance().currentUser
        print(googleUser?.userID)
        print(googleUser?.profile.name)
    
        
    
        var offsetMinutes: Int { return TimeZone.current.secondsFromGMT() / 60 }
        print("offset minutes", offsetMinutes)
        if(googleUser?.authentication != nil) {
            print("attempting to add event")
            let newEvent: GTLRCalendar_Event = GTLRCalendar_Event()
            newEvent.summary = name

            //set GTLRDateTimes
            //let startTime: GTLRDateTime = GTLRDateTime(date:startTimeObject!, offsetMinutes: offsetMinutes)
            let startTime: GTLRDateTime = GTLRDateTime(date: startTimeObject!)
            let googleStartTime = GTLRCalendar_EventDateTime.init()
            googleStartTime.dateTime = startTime

            //let endTime: GTLRDateTime = GTLRDateTime(date:endTimeObject!, offsetMinutes: offsetMinutes)
            let endTime: GTLRDateTime = GTLRDateTime(date: endTimeObject!)
            let googleEndTime = GTLRCalendar_EventDateTime.init()
            googleEndTime.dateTime = endTime
            
            newEvent.start = googleStartTime
            newEvent.end = googleEndTime
            //newEvent.start?.dateTime = startTime
            //newEvent.end?.dateTime = endTime
            
            //newEvent.reminders?.useDefault = 1
            
            let service: GTLRCalendarService = GTLRCalendarService()
            let query:GTLRCalendarQuery_EventsInsert = GTLRCalendarQuery_EventsInsert.query(withObject: newEvent, calendarId:"primary")
            //service.authorizer = googleUser!.authentication as! GTMFetcherAuthorizationProtocol
                //GTMFetcherAuthorizationProtocol
            service.authorizer = googleUser!.authentication.fetcherAuthorizer()
            service.executeQuery(query, completionHandler: {(ticket:GTLRServiceTicket?, object: Any?, error: Error?)->Void in
                print("executed query")
                if error == nil {
                    print("added")
                }
                else {
                    print("add failed")
                    print(error)
                }
                
            } as? GTLRServiceCompletionHandler)
//            service.executeQuery(query, completionHandler: {(_ callbackTicket: GTLRServiceTicket, _ event: GTLRCalendar_Event, _ callbackError: Error?) -> Void in
//     l           
//                } as? GTLRServiceCompletionHandler)
//            print("got here")
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let googleUser = GIDSignIn.sharedInstance().currentUser
        if (googleUser?.authentication != nil) {
            self.performSegue(withIdentifier: "viewCalendar", sender: UIView())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "viewCalendar"){
            let myCalendarView: MyCalendarView = segue.destination as! MyCalendarView
            myCalendarView.eventsList = eventsList
            myCalendarView.delegate = self
        }
//        if let myCalendarView = segue.destination as? MyCalendarView {
//            myCalendarView.eventsList = eventsList
//        }
//        
//        else if let addEventView = segue.destination as? AddEventView {
//            addEventView.delegate = self
//        }
    }

    // Construct a query and get a list of upcoming events from the user calendar
    func fetchEvents() {
        let googleUser = GIDSignIn.sharedInstance().currentUser
        if (googleUser?.authentication != nil) {
            let query = GTLRCalendarQuery_EventsList.query(withCalendarId: "primary")
            query.maxResults = 10
            query.timeMin = GTLRDateTime(date: Date())
            query.singleEvents = true
            query.orderBy = kGTLRCalendarOrderByStartTime
            
            query.timeZone = Calendar.current.timeZone.identifier
            service.executeQuery(
                query,
                delegate: self,
                didFinish: #selector(interpretEventsFromGoogle(ticket:finishedWithObject:error:)))
        }
        else {
            
        }
    }
    
    // Store the start dates and event summaries in the dictionary
    func interpretEventsFromGoogle(
        ticket: GTLRServiceTicket,
        finishedWithObject response : GTLRCalendar_Events,
        error : NSError?) {
        
        if let error = error {
            showAlert(title: "Error", message: error.localizedDescription)
            return
        }
        
        if let events = response.items, !events.isEmpty {
            eventsList.removeAll()
            for event in events {
                let start = event.start!.dateTime ?? event.start!.date!
                let startString = DateFormatter.localizedString(
                    from: start.date,
                    dateStyle: .short,
                    timeStyle: .short)
                var compos: Set<Calendar.Component> = Set<Calendar.Component>()
                compos.insert(.second)
                compos.insert(.minute)
                let diff = Calendar.current.dateComponents(compos, from:start.date, to:(event.end!.dateTime?.date)!)
                //print("event id?", event.iCalUID)
                print("event", event)
                print("start", start)
                let timeElapsed = diff.minute!
                eventsList.add(desc: "\(event.summary!)\n", dateTimeInfo: start.dateComponents,
                               timeElapsed: Int(timeElapsed), day: start.dateComponents.day!, month: start.dateComponents.month!,
                               year: start.dateComponents.year!, hour: start.dateComponents.hour!, minute: start.dateComponents.minute!, eventID: event.identifier!)
            }
        }
        
    }
    
    
    // Helper for showing an alert
    func showAlert(title : String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: nil
        )
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func passEventData(controller: AddEventView, name: String, date: String, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int) {
        print("event data")
        print(name)
        print(date)
        print(startHour, startMinute)
        print(endHour, endMinute)
    }
    
    
}
