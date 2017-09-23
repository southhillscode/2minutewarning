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
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        let topLabel = UILabel(frame: CGRect(x:0, y:0, width: customWidth, height: 15))
        topLabel.text = modelData[row].scheduleName
        topLabel.textColor = .black
        topLabel.textAlignment = .center
        topLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightThin)
        view.addSubview(topLabel)
        return view
    }
}

