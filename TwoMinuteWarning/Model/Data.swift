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
        data.append(ScheduleModel(scheduleName: "Regular", period: "0", time: "7:40"))
        data.append(ScheduleModel(scheduleName: "Late Start", period: "0", time: "8:37"))
        data.append(ScheduleModel(scheduleName: "Ext. Lunch", period: "0", time: "9:34"))
        data.append(ScheduleModel(scheduleName: "Ext. Break", period: "3", time: "10:31"))
        data.append(ScheduleModel(scheduleName: "Rally", period: "4", time: "11:38"))
        data.append(ScheduleModel(scheduleName: "Minimum", period: "5", time: "12:35"))
        data.append(ScheduleModel(scheduleName: "Final Exam 1", period: "6", time: "2:07"))
        data.append(ScheduleModel(scheduleName: "Final Exam 2", period: "7", time: "3:04"))
        
        
        /*data.append(ScheduleModel(scheduleName: "Regular", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:36-10:41", breakPeriod: "10:41-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date"))
        data.append(ScheduleModel(scheduleName: "Late Start", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:31", breakPeriod: "10:31-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date"))
        data.append(ScheduleModel(scheduleName: "Ext. Lunch", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:31", breakPeriod: "10:31-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date"))
        data.append(ScheduleModel(scheduleName: "Ext. Break", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:31", breakPeriod: "10:31-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date"))
        data.append(ScheduleModel(scheduleName: "Rally", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:31", breakPeriod: "10:31-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date"))
        data.append(ScheduleModel(scheduleName: "Minimum", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:31", breakPeriod: "10:31-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date"))
        data.append(ScheduleModel(scheduleName: "Final Exam", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:31", breakPeriod: "10:31-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date"))*/
        
        return data
    }
}
