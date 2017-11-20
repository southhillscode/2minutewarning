//
//  ViewController.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/12/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit
import UserNotifications

class ChangeScheduleViewController: UIViewController, SchedulePickerDelegate {

    @IBOutlet weak var classNotificationLabel: UILabel!
    @IBOutlet weak var dressNotificationLabel: UILabel!
    @IBOutlet weak var breakNotificationLabel: UILabel!
    @IBOutlet var schedulePicker: UIPickerView!
    
    var alert: UIAlertController!

    @IBOutlet var currentSchedule: UILabel!

    var dateModelPicker: ScheduleModelPicker!
    let myDate = Date()
    let formatter = DateFormatter()
    let setUpAlarm = MyAlarm()
    var rotationAngle: CGFloat!
    var scheduleData = [ScheduleModel]()

    @IBAction func classNotificationSwitch(_: UISwitch) {
        setClassNotification()
    }

    @IBAction func breakNotificationSwitch(_: UISwitch) {
        setBreakNotification()
    }

    @IBAction func dressNotificationSwitch(_: UISwitch) {
        setDressNotification()
    }

    override func viewWillAppear(_: Bool) {
        scheduleData = Data.getData()
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        setupUI()

        rotationAngle = -90 * (.pi / 180)

        let y = schedulePicker.frame.origin.y

        // dateModelPicker becomes a UIPicker reference of type ScheduleModelPicker.
        dateModelPicker = ScheduleModelPicker()

        // dateModelPicker fills its instance array with data that it gets from the Model's Date class.
        dateModelPicker.modelData = Data.getData()

        // schedulePicker (*view*) uses delegate and datasource to fill info and notify when this data has changed.
        schedulePicker.delegate = dateModelPicker

        // schedulePicker data is set to the dateModelPicker's data.
        schedulePicker.dataSource = dateModelPicker

        // set the schedulePickerDelegate to self
        dateModelPicker.pickerDelegate = self

        // set current schedule label with picker data
        currentSchedule.text = "Regular"

        // Transform the original pickerView that was place on the storyboard
        schedulePicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        schedulePicker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 100)
    }

    func setNotification() {

        // Get the current year, month, and day
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)

        // Create var to hold the the scheduele
        var regularSchedule: ScheduleModel!
        var rallySchedule: ScheduleModel!
        var lateStartSchedule: ScheduleModel!

        // Loop through the data to extract the schedule
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
            // Set Regular Schedule Notifications
            for (period, time) in regularSchedule.currentSchedule {

                setUpAlarm.createNotif(year: year, month: month, day: day, hour: time.hour!, minute: time.minute!, identifier: "\(period)\(time)", content: "Period \(period) of \(regularSchedule.scheduleName) is about to end in 2 minutes")
            }
            print("Regular Schedule Set")
        case "Rally":
            // Loop through each dictionaries of schedule in the scheduleModel
            for (period, time) in rallySchedule.currentSchedule {

                setUpAlarm.createNotif(year: year, month: month, day: day, hour: time.hour!, minute: time.minute!, identifier: "\(period)\(time)", content: "Period \(period) of \(rallySchedule.scheduleName) is about to end in 2 minutes")
            }
            print("Rally Schedule Set")
        case "Late Start":
            // Loop theough each dictionaries of schedule in the scheduleModel
            for (period, time) in lateStartSchedule.currentSchedule {
                setUpAlarm.createNotif(year: year, month: month, day: day, hour: time.hour!, minute: time.minute!, identifier: "\(period)\(time)", content: "Period \(period) of \(lateStartSchedule.scheduleName) is about to end in 2 minutes")
            }
            print("Late Start Schedule Set")
        case "Minimum":
            // Set Regular Schedule Notifications
            print("Minimum Schedule Set")
        case "Extended Break":
            // Set Regular Schedule Notifications
            print("Extended Break Schedule Set")
        case "Extended Lunch":
            // Set Regular Schedule Notifications
            print("Extended Lunch Schedule Set")
        default:
            print("this is the default setting")
        }
    }

    @IBAction func saveTapped(_: UIBarButtonItem) {

        alert = UIAlertController(title: "Confirmation", message: "Do you want to set \(currentSchedule.text!) as your current schedule?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in

            // We want to clear everytime
            self.setUpAlarm.clearNotification()

            // Then set the new notification with the new settings
            self.setNotification()

            // Go back to the main screen
            self.dismiss(animated: true, completion: nil)

            let onBoardVC = self.presentingViewController as! OnBoardVC
            onBoardVC.loadViewIfNeeded()
            onBoardVC.currentSchedule.text = self.currentSchedule.text!
            self.present(self.alert, animated: true, completion: nil)

        }))
        alert.addAction(UIAlertAction(title: "Never Mind!", style: .destructive, handler: { _ in

            print("Action Cancelled")
        }))

        present(alert, animated: true, completion: nil)
    }

    @IBAction func backTapped(_: Any) {

        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    func selectionMade(schedule: String) {
        currentSchedule.text = schedule
        setNotification()
    }
}
