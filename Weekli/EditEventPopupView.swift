//
//  EditEventPopupView.swift
//  Weekli
//
//  Created by Paul Gouw on 12/20/17.
//  Copyright © 2017 abrarandpaul. All rights reserved.
//

import UIKit

protocol EditEventDelegate: class {
    func passDeleteEventData(controller: EditEventPopupView, eventID: String)
}

class EditEventPopupView: UIViewController {
    
    var targetEventID: String? = ""
    weak var delegate : EditEventDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        print("targetEventID", targetEventID)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func yesPressed(_ sender: Any) {
        delegate?.passDeleteEventData(controller: self, eventID: targetEventID!)
        print("targetEventID from yes", targetEventID)
        self.view.removeFromSuperview()
        
    }
    
    @IBAction func noPressed(_ sender: Any) {
        self.view.removeFromSuperview()
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
