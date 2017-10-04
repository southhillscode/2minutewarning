//
//  ScheduleModelPicker.swift
//  TwoMinuteWarning
//
//  Created by Rob Fitzgerald on 9/22/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit
protocol CurrentScheduleDelegate {
    func setCurrentSchedule(string myLabel: String)
    func getCurrentSchedule() -> String
}
class ScheduleModelPicker: UIPickerView
{
    
    var modelData: [ScheduleModel]!
    var customWidth: CGFloat = 100
    var customHeight: CGFloat = 100
    var rotationAngle: CGFloat!
    var myLabelName: String!
    var scheduleDelegate: CurrentScheduleDelegate?
}

extension ScheduleModelPicker: UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return modelData.count
    }
}

extension ScheduleModelPicker: UIPickerViewDelegate
{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return modelData[row].scheduleName
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return customHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        rotationAngle = 90 * (.pi/180)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        var schedulePickerBtn: UIButton!
        schedulePickerBtn = UIButton(frame: CGRect(x: 20, y: 275, width: customWidth, height: customHeight))
        schedulePickerBtn.setTitle(modelData[row].scheduleName, for: UIControlState.normal)
        
        let middleLabel = UILabel(frame: CGRect(x:0, y:0, width: customWidth, height: customHeight))
        middleLabel.text = modelData[row].scheduleName
        middleLabel.textColor = .black
        middleLabel.textAlignment = .center
        middleLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightThin)
    
        view.addSubview(middleLabel)
        view.transform = CGAffineTransform(rotationAngle: rotationAngle)
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        myLabelName = modelData[row].scheduleName
        print("\(myLabelName!) is in myLabelName")
        scheduleDelegate?.setCurrentSchedule(string: myLabelName!)
        
        switch myLabelName {
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
    
        //print("\(myLabelName!) notification is set from ScheduleModelPicker class")
    }
}

