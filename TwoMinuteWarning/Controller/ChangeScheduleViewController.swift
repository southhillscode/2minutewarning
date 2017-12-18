//
//  ViewController.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/12/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit
import CoreData
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
    let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
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



    @IBAction func saveTapped(_: UIBarButtonItem) {

        alert = UIAlertController(title: "Confirmation", message: "Do you want to set \(currentSchedule.text!) as your current schedule?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in

            // We want to clear everytime
            self.setUpAlarm.clearNotification()

            // Then set the new notification with the new settings
            self.setUpAlarm.setNotification(for: self.currentSchedule.text!)

            // Go back to the main screen
            self.dismiss(animated: true, completion: nil)

            let onBoardVC = self.presentingViewController as! OnBoardVC
            onBoardVC.loadViewIfNeeded()
            onBoardVC.currentSchedule.text = self.currentSchedule.text!
            
            let entity = NSEntityDescription.entity(forEntityName: "ScheduleSettings", in: self.context)
            let settings = NSManagedObject(entity: entity!, insertInto: self.context)
            
            settings.setValue(self.currentSchedule.text!, forKey: "currentSchedule")
            do {
                try self.context.save()
                print()
            } catch {
                print("Failed saving")
            }
            
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
    }
}
