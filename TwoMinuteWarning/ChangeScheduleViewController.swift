//
//  ViewController.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/12/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit

class ChangeSceduleViewController: UIViewController {
    
    @IBOutlet var classNotificationSwitch: UIButton!
    @IBOutlet var breakNotificationSwitch: UIButton!
    @IBOutlet var dressNotificationSwitch: UIButton!
    @IBOutlet var schedule: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        /* Do any additional setup after loading the view, typically from a nib.
         let switchButton = UIButton(type: .Custom)
         switchButton.selected = true
         switchButton.setImage(UIImage(named: "on-switch"), forState: .Selected)
         switchButton.setImage(UIImage(named: "off-switch"), forState: .Normal)
         Use switchButton.selected instead of switch1.on. You'll have to toggle switchButton.selected when it is tapped (switchButton.selected = !switchButton.selected).

         */
        
        //classNotificationSwitch.setImage(UIImage(named: "on-switch"), for: .selected)
        
        schedule.selectedRow(inComponent: 0)
    }

    @IBAction func saveTapped(_ sender: UIBarButtonItem){
        print("The save button was tapped.")
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

