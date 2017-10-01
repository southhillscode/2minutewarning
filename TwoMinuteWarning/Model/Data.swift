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
        
        
        //Build-in schedule
        let regularSchedule: [Int:String] = [0:"7:40",1:"8:37",2:"9:34",3:"10:31",4:"11:38",5:"12:35",6:"2:07",7:"3:04"]
        let rallySchedule: [Int:String] = [0:"7:40",1:"8:29",2:"9:18",3:"10:07",4:"12:02",5:"12:51",6:"2:15",7:"3:04"]
        
        //Array of type ScheduleModels
        var data = [ScheduleModel]()
        data.append(ScheduleModel(scheduleName: "Regular", schedule: regularSchedule))
        data.append(ScheduleModel(scheduleName: "Rally", schedule: rallySchedule))
        
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
