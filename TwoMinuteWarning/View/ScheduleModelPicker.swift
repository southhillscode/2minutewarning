//
//  DateModelPicker.swift
//  TwoMinuteWarning
//
//  Created by Rob Fitzgerald on 9/22/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit

class ScheduleModelPicker: UIPickerView
{
    var modelData: [ScheduleModel]!
    let customWidth: CGFloat = 100
    let customHeight: CGFloat = 100
    var rotationAngle: CGFloat!
    var currentSchedule: String!
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
        currentSchedule = modelData[row].scheduleName
        print("\(currentSchedule!) is in my pickerView")
        setName(thisIsMyVariable: currentSchedule!)
        let myCounter = modelData.count
        print(myCounter)
        for _ in modelData {
                print("this is my time \(modelData[row].time)")
            
        }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        
        let middleLabel = UILabel(frame: CGRect(x:0, y:0, width: customWidth, height: customHeight))
        middleLabel.text = modelData[row].scheduleName
        middleLabel.textColor = .black
        middleLabel.textAlignment = .center
        middleLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightThin)
        view.addSubview(middleLabel)
        
        view.transform = CGAffineTransform(rotationAngle: rotationAngle)
        
        return view
    }
    
    func getName() -> String {
        let myCurrentstring = "currentSchedule!"
        return myCurrentstring
        
    }
    
    func setName(thisIsMyVariable myLabel: String) {
        currentSchedule! = myLabel
        print("\(currentSchedule!) is in my SetName")
        
    }
}

