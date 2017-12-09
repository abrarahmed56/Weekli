//
//  ViewController.swift
//  Weekli
//
//  Created by nyuguest on 11/18/17.
//  Copyright © 2017 abrarandpaul. All rights reserved.
//
/*
import UIKit

class ViewController: UIViewController, GIDSignInUIDelegate {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var output: UILabel!
    
    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    private let scopes = [kGTLRAuthScopeCalendarReadonly]
    
    private let service = GTLRCalendarService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
 
        GIDSignIn.sharedInstance().scopes = scopes

        // Uncomment to automatically sign in the user.
        GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
        
        // Do any additional setup after loading the view, typically from a nib.
        changeBackgroundColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        changeBackgroundColor()
    }
    
    func changeBackgroundColor() {
        let googleUser = GIDSignIn.sharedInstance().currentUser;
        if (googleUser?.authentication != nil) {
            self.infoLabel.text = "Authentic!";
            self.view.backgroundColor = UIColor.red;
            NSLog("background color changed, user exists");
            let query = GTLRCalendarQuery_EventsList.query(withCalendarId: "primary")
            query.maxResults = 10
            query.timeMin = GTLRDateTime(date: Date())
            query.singleEvents = true
            query.orderBy = kGTLRCalendarOrderByStartTime
            service.executeQuery(
                query,
                delegate: self,
                didFinish: #selector(displayResultWithTicket(ticket:finishedWithObject:error:)))
        } else {
            // To authenticate, use Google+ sign-in button.
            self.infoLabel.text = "Not Authentic...";
            self.view.backgroundColor = UIColor.blue;
            NSLog("blue");
        }

    }
    
    func displayResultWithTicket(
        ticket: GTLRServiceTicket,
        finishedWithObject response : GTLRCalendar_Events,
        error : NSError?) {
        NSLog("display called")
        
        if let error = error {
            showAlert(title: "Error", message: error.localizedDescription)
            return
        }
        NSLog("blahhhh")
        var outputText = ""
        if let events = response.items, !events.isEmpty {
            for event in events {
                let start = event.start!.dateTime ?? event.start!.date!
                let startString = DateFormatter.localizedString(
                    from: start.date,
                    dateStyle: .short,
                    timeStyle: .short)
                outputText += "\(startString) - \(event.summary!)\n"
            }
        } else {
            outputText = "No upcoming events found."
        }
        output.text = outputText
        NSLog(outputText)
    }


    @IBAction func didTapSignOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        changeBackgroundColor()
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

    /*func fetchEvents() {
        let query = GTLRCalendarQuery_EventsList.query(withCalendarId: "primary")
        query.maxResults = 10
        query.timeMin = GTLRDateTime(date: Date())
        query.singleEvents = true
        query.orderBy = kGTLRCalendarOrderByStartTime
        service.executeQuery(
            query,
            delegate: self,
            didFinish: #selector(displayResultWithTicket(ticket:finishedWithObject:error:)))
    }*/

}*/







//import GoogleAPIClientForREST
//import GoogleSignIn
import UIKit

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    
    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    private let scopes = [kGTLRAuthScopeCalendarReadonly]
    
    private let service = GTLRCalendarService()
    //let signInButton = GIDSignInButton()
    //let signOutButton = UIButton()
    //let output = UITextView()
    //@IBOutlet weak var infoLabel: UILabel!
    //@IBOutlet weak var output: UILabel!
    var eventsList = DayDictionary()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().signOut()
        
        // Configure Google Sign-in.
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().scopes = scopes
        GIDSignIn.sharedInstance().signInSilently()
        
        // Add the sign-in button.
        //view.addSubview(signInButton)
        
        // Add a UITextView to display output.
        //output.frame = view.bounds
        //output.isEditable = false
        //output.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        //output.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        //output.isHidden = true
        //view.addSubview(output);
        
        //view.addSubview(signOutButton)
    }
    
    /*func signOut(sender: UIButton!) {
        GIDSignIn.sharedInstance().signOut()
    }*/
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            showAlert(title: "Authentication Error", message: error.localizedDescription)
            self.service.authorizer = nil
        } else {
            //self.signInButton.isHidden = true
            //self.output.isHidden = false
            self.service.authorizer = user.authentication.fetcherAuthorizer()
            fetchEvents()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let googleUser = GIDSignIn.sharedInstance().currentUser;
        if (googleUser?.authentication != nil) {
            self.performSegue(withIdentifier: "viewCalendar", sender: UIView())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let myCalendarView = segue.destination as? MyCalendarView {
            myCalendarView.eventsList = eventsList
        }
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
        
        //var outputText = ""
        if let events = response.items, !events.isEmpty {
            for event in events {
                let start = event.start!.dateTime ?? event.start!.date!
                let startString = DateFormatter.localizedString(
                    from: start.date,
                    dateStyle: .short,
                    timeStyle: .short)
                eventsList.add(desc: "\(startString) - \(event.summary!)\n", dateTimeInfo: start.dateComponents)
                /*outputText += "\(startString) - \(event.summary!)\n"
                eventsList.append("\(startString) - \(event.summary!)\n")
                var dayEvents = eventsDict[start.date]
                var eventString : String
                var eventDateComponents : DateComponents
                var todaysEvents : (String, DateComponents)
                if ( dayEvents == nil ) {
                    eventString = ""
                    eventDateComponents = start.dateComponents
                }
                else {
                    eventString = dayEvents.0
                    eventDateComponents = start.dateComponents
                }
                currentValString.append("\(startString) - \(event.summary!)\n")
                eventsDict[start.date] = (currentValString, currentVal.1);*/
            }
        } else {
            //outputText = "No upcoming events found."
        }
        //eventsListText = outputText
        //output.text = outputText
        
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
    
    
}
