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
    let customWidth: CGFloat = 100
    let customHeight: CGFloat = 100
    var rotationAngle: CGFloat!
    var currentSchedule: String!




    
    func getPickerView(pickerViewLabel:String) -> UIView {
        
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        
        let topLabel = UILabel(frame: CGRect(x:0, y:0, width: customWidth, height: customHeight))
        topLabel.text = pickerViewLabel
        topLabel.textColor = .black
        topLabel.textAlignment = .center
        topLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold )
        view.addSubview(topLabel)
        
        return view
        
    }
}

