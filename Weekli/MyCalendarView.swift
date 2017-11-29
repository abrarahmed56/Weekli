//
//  MyCalendarView.swift
//  Weekli
//
//  Created by nyuguest on 11/21/17.
//  Copyright © 2017 abrarandpaul. All rights reserved.
//

import UIKit

class MyCalendarView: UIViewController {

    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    
    //let eventsText : NSString? = "blah"
    var eventsText : String?

    @IBOutlet weak var displayEvents: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayEvents.text = eventsText
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        displayEvents.text = eventsText
        //NSLog("display events text")
        //NSLog(eventsText!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSignOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        self.dismiss(animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
