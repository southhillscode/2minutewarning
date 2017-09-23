//
//  Data.swift
//  TwoMinuteWarning
//
//  Created by Rob Fitzgerald on 9/22/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import Foundation

class Data {
    class func getData() -> [ScheduleModel] {
        
        //Array of type ScheduleModels
        var data = [ScheduleModel]()
        data.append(ScheduleModel(scheduleName: "Regular", period0: 738, period1: 835, period2: 932, period3: 1029, period4: 1136, period5: 1233, period6: 1405, period7: 1502, date: Date()))
        data.append(ScheduleModel(scheduleName: "Rally", period0: 738, period1: 835, period2: 932, period3: 1029, period4: 1136, period5: 1233, period6: 1405, period7: 1502, date: Date()))
        data.append(ScheduleModel(scheduleName: "Late Start", period0: 738, period1: 835, period2: 932, period3: 1029, period4: 1136, period5: 1233, period6: 1405, period7: 1502, date: Date()))
        data.append(ScheduleModel(scheduleName: "Minimum Day", period0: 738, period1: 835, period2: 932, period3: 1029, period4: 1136, period5: 1233, period6: 1405, period7: 1502, date: Date()))
        data.append(ScheduleModel(scheduleName: "Extended Break", period0: 738, period1: 835, period2: 932, period3: 1029, period4: 1136, period5: 1233, period6: 1405, period7: 1502, date: Date()))
        data.append(ScheduleModel(scheduleName: "Extended Lunch", period0: 738, period1: 835, period2: 932, period3: 1029, period4: 1136, period5: 1233, period6: 1405, period7: 1502, date: Date()))
        return data
    }
}
