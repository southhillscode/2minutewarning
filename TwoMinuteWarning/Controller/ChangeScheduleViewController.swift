//
//  ViewController.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/12/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit
import UserNotifications

class ChangeScheduleViewController: UIViewController {
    
    @IBOutlet weak var classNotificationLabel: UILabel!
    @IBOutlet weak var dressNotificationLabel: UILabel!
    @IBOutlet weak var breakNotificationLabel: UILabel!
    @IBOutlet var schedulePicker:  UIPickerView!
    
    @IBOutlet var currentSchedule: UILabel!
    
    var dateModelPicker: ScheduleModelPicker!
    let myDate = Date()
    let formatter = DateFormatter()
    var rotationAngle: CGFloat!
    
    @IBAction func classNotificationSwitch(_ sender: UISwitch) {
        setClassNotification()
    }
    
    @IBAction func breakNotificationSwitch(_ sender: UISwitch) {
        setBreakNotification()
    }
    
    @IBAction func dressNotificationSwitch(_ sender: UISwitch) {
        setDressNotification()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
       
        rotationAngle = -90 * (.pi/180)
        
        let y = schedulePicker.frame.origin.y
        
        //dateModelPicker becomes a UIPicker reference of type ScheduleModelPicker.
        dateModelPicker = ScheduleModelPicker()
        
        //dateModelPicker fills its instance array with data that it gets from the Model's Date class.
        dateModelPicker.modelData = Data.getData()
        
        //schedulePicker (*view*) uses delegate and datasource to fill info and notify when this data has changed.
        schedulePicker.delegate = dateModelPicker
        
        //schedulePicker data is set to the dateModelPicker's data.
        schedulePicker.dataSource = dateModelPicker
        
        //set current schedule label with picker data
        
        //Transform the original pickerView that was place on the storyboard
        schedulePicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        schedulePicker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 100)
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
        let messege = "\(String(describing: currentSchedule.text)) is set for notifications"
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

