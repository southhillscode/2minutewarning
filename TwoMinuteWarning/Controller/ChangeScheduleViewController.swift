//
//  ViewController.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/12/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit
import UserNotifications

class ChangeScheduleViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var classNotificationLabel: UILabel!
    @IBOutlet weak var dressNotificationLabel: UILabel!
    @IBOutlet weak var breakNotificationLabel: UILabel!
    @IBOutlet weak var currentSchedule: UILabel!
    @IBOutlet weak var schedulePicker:  UIPickerView!
    var myString: String!
    let myDate = Date()
    let formatter = DateFormatter()
    var rotationAngle: CGFloat!
    var modelData: [ScheduleModel]!
    let scheduleModelPicker = ScheduleModelPicker()


    
    @IBAction func classNotificationSwitch(_ sender: UISwitch) {
        classNotificationSet()
    }
    
    @IBAction func breakNotificationSwitch(_ sender: UISwitch) {
        breakNotificationSet()
    }
    
    @IBAction func dressNotificationSwitch(_ sender: UISwitch) {
        dressNotificationSet()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        modelData = Data.getData()
        
        myText = "class notification"
        
        //Set the default schedule text
        currentSchedule.text = modelData[0].scheduleName
        
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.string(from: myDate)
        print(myDate)
        
        rotationAngle = -90 * (.pi/180)
        
        //let y = schedulePicker.frame.origin.y


        
        //schedulePicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        //schedulePicker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 100)
        
        //schedulePicker (*view*) uses delegate and datasource to fill info and notify when this data has changed.
        schedulePicker.delegate = self
        schedulePicker.dataSource = self
        myString = currentSchedule.text!
        
        print(myString)
            
    }
    
    var myText: String{
        get{
            return String(describing: classNotificationLabel.text!)
        }
        set(newText){
            classNotificationLabel.text = String(newText)
        }
    }
    
    func setNotification(){
        switch currentSchedule.text! {
        case "Regular":
            //Set Regular Schedule Notifications
            print("Regular Schedule Set")
        case "Rally":
            //Set Regular Schedule Notifications
            print("Rally Schedule Set")
        case "Late Start":
            //Set Regular Schedule Notifications
            print("Late Start Schedule Set")
        case "Minimum":
            //Set Regular Schedule Notifications
            print("Minimum Schedule Set")
        case "Extended Break":
            //Set Regular Schedule Notifications
            print("Extended Break Schedule Set")
        case "Extended Lunch":
            //Set Regular Schedule Notifications
            print("Extended Lunch Schedule Set")
        default:
            print("this is the default setting")
        }
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem){
        
        print("The save button was tapped.")
        print(currentSchedule.text!)
        let messege = "\(currentSchedule.text!) is set for notifications"
        let content = UNMutableNotificationContent()
        content.body = messege
        content.sound = UNNotificationSound.default()
        
        let today = Date()
        var dateComponents = Calendar.current.dateComponents([.month, .day], from: today)
        dateComponents.hour = 9
        dateComponents.minute = 32
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        if let identifier = currentSchedule.text{
            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
            let center = UNUserNotificationCenter.current()
            center.add(request, withCompletionHandler: nil)
        }
    }
    
   
    
    //UIPickerView Delegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return modelData.count
    }
    
    
    //UIPickerViewDataSource
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return modelData[row].scheduleName
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return scheduleModelPicker.customHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
      
        
        //Return a pi
        return scheduleModelPicker.getPickerView(pickerViewLabel: modelData[row].scheduleName)
    }
    
    func getName() -> String {
        
        return "\(currentSchedule) is set as my Schedule"
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        print(getName())
        currentSchedule.text = modelData[row].scheduleName

    }
    

    
}
    
