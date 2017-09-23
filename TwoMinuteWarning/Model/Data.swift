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
        data.append(ScheduleModel(scheduleName: "Regular", period0: "Place Entire Schedule Here", period1: "8:37", period2: "9:34", period3: "10:31", period4: "11:38", period5: "12:33", period6: "2:07", period7: "3:04", date: "My Date"))
        data.append(ScheduleModel(scheduleName: "Late Start", period0: "Place Entire Schedule Here", period1: "8:37", period2: "9:34", period3: "10:31", period4: "11:38", period5: "12:33", period6: "2:07", period7: "3:04", date: "My Date"))
        data.append(ScheduleModel(scheduleName: "Extended Break", period0: "Place Entire Schedule Here", period1: "8:37", period2: "9:34", period3: "10:31", period4: "11:38", period5: "12:33", period6: "2:07", period7: "3:04", date: "My Date"))
        data.append(ScheduleModel(scheduleName: "Extended Lunch", period0: "Place Entire Schedule Here", period1: "8:37", period2: "9:34", period3: "10:31", period4: "11:38", period5: "12:33", period6: "2:07", period7: "3:04", date: "My Date"))
        data.append(ScheduleModel(scheduleName: "Minimum Day", period0: "Place Entire Schedule Here", period1: "8:37", period2: "9:34", period3: "10:31", period4: "11:38", period5: "12:33", period6: "2:07", period7: "3:04", date: "My Date"))
        return data
    }
}
