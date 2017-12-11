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
    private let scopes = [kGTLRAuthScopeCalendarReadonly]
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
    
    func passAddEventData(controller: MyCalendarView, name: String, date: String, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int) {
        print("data from view controller delegate")
        print(name)
        print(date)
        print(startHour)
        print(startMinute)
        print(endHour)
        print(endMinute)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let googleUser = GIDSignIn.sharedInstance().currentUser;
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
        let googleUser = GIDSignIn.sharedInstance().currentUser;
        if (googleUser?.authentication != nil) {
            let query = GTLRCalendarQuery_EventsList.query(withCalendarId: "primary")
            query.maxResults = 10
            query.timeMin = GTLRDateTime(date: Date())
            query.singleEvents = true
            query.orderBy = kGTLRCalendarOrderByStartTime
            query.timeZone = "EST"
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
                let timeElapsed = diff.minute!
                eventsList.add(desc: /*"\(startString) - */"\(event.summary!)\n", dateTimeInfo: start.dateComponents,
                               timeElapsed: Int(timeElapsed), day: start.dateComponents.day!, month: start.dateComponents.month!,
                               year: start.dateComponents.year!, hour: start.dateComponents.hour!, minute: start.dateComponents.minute!)
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
