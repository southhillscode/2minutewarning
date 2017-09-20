//
//  ViewController.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/12/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit

class ChangeSceduleViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var classNotificationLabel: UILabel!
    var label: UILabel!
    var classNotificationSwitch: UISwitch!
    var breakNotificationSwitch: UISwitch!
    var dressNotificationSwitch: UISwitch!
    var breakNotificationLabel:  ScheduleLabel!
    var dressNotificationLabel:  ScheduleLabel!
    
    @IBOutlet weak var schedulePicker:  UIPickerView!
    @IBOutlet weak var currentSchedule: UILabel!
    
    let scheduleArray = ["Regular", "Rally", "Late Start", "Minimum", "Extended Break", "Extended Lunch"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return scheduleArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return scheduleArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentSchedule.text = scheduleArray[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classNotificationSwitch = UISwitch(frame: CGRect(x: 20, y: 125, width: 0, height: 0))
        breakNotificationSwitch = UISwitch(frame: CGRect(x: 20, y: 200, width: 0, height: 0))
        dressNotificationSwitch = UISwitch(frame: CGRect(x: 20, y: 275, width: 0, height: 0))
        view.addSubview(classNotificationSwitch)
        view.addSubview(breakNotificationSwitch)
        view.addSubview(dressNotificationSwitch)
        
        // CGRectMake has been deprecated - and should be let, not var
        let label = UILabel(frame: CGRect(x: 20, y: 175, width: 200, height: 21))
        
        // you will probably want to set the font (remember to use Dynamic Type!)
        //label.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        // and set the text color too - remember good contrast
        label.textColor = .black
        
        // may not be necessary (e.g., if the width & height match the superview)
        // if you do need to center, CGPointMake has been deprecated, so use this
        //label.center = CGPoint(x: 20, y: 175)
        
        // this changed in Swift 3 (much better, no?)
        //labelNotificationLabel.textAlignment = .center
        
        // set text of label
        label.text = "Break Notification"
        myText = "class notification"
        self.view.addSubview(label)
        turnSwitchOn()
        currentSchedule.text = scheduleArray[0]
    }
    
    var myText: String{
        get{
            return String(describing: classNotificationLabel.text!)
        }
        set(newText){
            classNotificationLabel.text = String(newText)
            classNotificationLabel.text = String(newText)?.capitalized
        }
    }
    
    func turnSwitchOn(){
        classNotificationSwitch.setOn(false, animated: true)
        if classNotificationSwitch.isOn {
            print("the switch is on")
        } else {
            print("the switch is off")
        }
    }

    @IBAction func saveTapped(_ sender: UIBarButtonItem){
        print("The save button was tapped.")
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

