//
//  EditEventPopupView.swift
//  Weekli
//
//  Created by Paul Gouw on 12/20/17.
//  Copyright © 2017 abrarandpaul. All rights reserved.
//

import UIKit

class EditEventPopupView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func yesPressed(_ sender: Any) {
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
