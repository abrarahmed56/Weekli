//
//  AddEventView.swift
//  Weekli
//
//  Created by Paul Gouw on 12/10/17.
//  Copyright © 2017 abrarandpaul. All rights reserved.
//

import UIKit

protocol AddEventViewDelegate: class {
    func passEventData(controller: AddEventView, name: String, date: String, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int)
}

class AddEventView: UIViewController {
    var name : String? = ""
    var date : String? = ""
    var startHour : Int? = 0
    var startMinute : Int? = 0
    var endHour : Int? = 0
    var endMinute : Int? = 0
    weak var delegate : AddEventViewDelegate? = nil
   
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var startTimePicker: UIDatePicker!
    @IBOutlet weak var endTimePicker: UIDatePicker!
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func textFieldDidChange(_ sender: Any) {
        let text: String = nameTextField.text!
        self.name = text
    }
    
    @IBAction func okay(_ sender: Any) {
        print("Data from form")
        print(name!)
        print(date!)
        print(startHour!)
        print(startMinute!)
        print(endHour!)
        print(endMinute!)
        delegate?.passEventData(controller: self, name: name!, date: date!, startHour: startHour!, startMinute: startMinute!, endHour: endHour!, endMinute: endMinute!)
        dismiss(animated: true)
    }
    @IBAction func onDatePickerChange(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd MMM yy"
        print("datepicker", datePicker.date)
        let strDate = dateFormatter.string(from: datePicker.date)
        print("strdate", strDate)
        self.date = strDate
        print("date", date!)
    }
    @IBAction func onStartTimePickerChange(_ sender: Any) {
        
        let date = startTimePicker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        self.startHour = hour
        self.startMinute = minute
    }
    @IBAction func onEndTimePickerChange(_ sender: Any) {
        let date = endTimePicker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        endHour = hour
        endMinute = minute
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "mySegue"{
//            let vc = segue.destinationViewController as! FooTwoViewController
//            vc.colorString = colorLabel.text!
//            vc.delegate = self
//        }
//    }

}
