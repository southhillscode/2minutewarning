//
//  ViewController.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/12/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit
import UserNotifications

<<<<<<< HEAD
class ChangeScheduleViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
=======
class ChangeScheduleViewController: UIViewController, SchedulePickerDelegate {
>>>>>>> PickerConnection
    
    @IBOutlet weak var classNotificationLabel: UILabel!
    @IBOutlet weak var dressNotificationLabel: UILabel!
    @IBOutlet weak var breakNotificationLabel: UILabel!
<<<<<<< HEAD
    @IBOutlet weak var currentSchedule: UILabel!
    @IBOutlet weak var schedulePicker:  UIPickerView!
    var myString: String!
=======
    @IBOutlet var schedulePicker:  UIPickerView!
    
    @IBOutlet var currentSchedule: UILabel!
    
    var dateModelPicker: ScheduleModelPicker!
>>>>>>> PickerConnection
    let myDate = Date()
    let formatter = DateFormatter()
    let setUpAlarm = MyAlarm()
    var rotationAngle: CGFloat!
<<<<<<< HEAD
    var modelData: [ScheduleModel]!
    let scheduleModelPicker = ScheduleModelPicker()


=======
    var scheduleData = [ScheduleModel]()
>>>>>>> PickerConnection
    
    @IBAction func classNotificationSwitch(_ sender: UISwitch) {
        setClassNotification()
        
    }
    
    @IBAction func breakNotificationSwitch(_ sender: UISwitch) {
        setBreakNotification()
    }
    
    @IBAction func dressNotificationSwitch(_ sender: UISwitch) {
        setDressNotification()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        scheduleData = Data.getData()
    }
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        setupUI()
<<<<<<< HEAD
        
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
    
=======
        
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
        
        //set the schedulePickerDelegate to self
        dateModelPicker.pickerDelegate = self
        
        //set current schedule label with picker data
        currentSchedule.text = "Regular"
        
        //Transform the original pickerView that was place on the storyboard
        schedulePicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        schedulePicker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 100)
    }
>>>>>>> PickerConnection
    func setNotification(){
        
        
        
        //Get the current year, month, and day
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        //Create var to hold the the scheduele
        var regularSchedule : ScheduleModel!
        var rallySchedule: ScheduleModel!
        var lateStartSchedule: ScheduleModel!
        
        //Loop through the data to extract the schedule
        for schedule in dateModelPicker.modelData {
            
            switch schedule.scheduleName {
                
            case "Regular":
                
                regularSchedule = schedule
                
            case "Rally":
                
                rallySchedule = schedule
                
            case "Late Start":
                
                lateStartSchedule = schedule
                
            default:
                
                print("\(schedule.scheduleName) not found")
                
                
                
            }
            
            
            
        }
        
        
        switch currentSchedule.text! {
        case "Regular":
            //Set Regular Schedule Notifications
            print("\(currentSchedule.text!) Schedule Set from switch statement")
        case "Rally":
            
            //Loop theough each dictionaries of schedule in the scheduleModel
            for (period,time) in rallySchedule.currentSchedule {
                
                setUpAlarm.createNotif(year: year, month: month, day: day, hour: time.hour!, minute: time.minute!, identifier: "\(period)\(time)", content: "Period \(period) of \(rallySchedule.scheduleName) is about to end in 2 minutes")
                
            }
            print("Rally Schedule Set")
        case "Late Start":
            //Loop theough each dictionaries of schedule in the scheduleModel
            for (period,time) in lateStartSchedule.currentSchedule {
                setUpAlarm.createNotif(year: year, month: month, day: day, hour: time.hour!, minute: time.minute!, identifier: "\(period)\(time)", content: "Period \(period) of \(lateStartSchedule.scheduleName) is about to end in 2 minutes")
            }
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
            
            
            
            
            let alert = UIAlertController(title: "Confirmation", message: "Do you want to set \(currentSchedule.text!) as your current schedule?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                
                //We want to clear everytime
                self.setUpAlarm.clearNotification()
                
                //Then set the new notification with the new settings
                self.setNotification()
                
                //Go back to the main screen
                self.performSegue(withIdentifier: "goBack", sender: self)
                
                
            }))
            alert.addAction(UIAlertAction(title: "Never Mind!", style: .destructive, handler: { (action) in
                
                
                print("Action Cancelled")
            }))
            
            present(alert, animated: true, completion: nil)
            
        }
    }
    
   
    
    //UIPickerView Delegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
<<<<<<< HEAD
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
=======
    func selectionMade(schedule: String) {
        currentSchedule.text = schedule
        setNotification()
    }
    
}
>>>>>>> PickerConnection

    }
    

    
}
    
