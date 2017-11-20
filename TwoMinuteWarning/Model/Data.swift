//
//  Data.swift
//  TwoMinuteWarning
//
//  Created by Rob Fitzgerald on 9/22/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import Foundation

let alarmModel = MyAlarm()

class Data {
    class func getData() -> [ScheduleModel] {

        let regularSchedule = alarmModel.turnDatesIntoDateComponet(scheduleDictionary: alarmModel.regularSchedule)
        let lateStartSchedule = alarmModel.turnDatesIntoDateComponet(scheduleDictionary: alarmModel.lateStartSchedule)
        let extendedLunchSchedule = alarmModel.turnDatesIntoDateComponet(scheduleDictionary: alarmModel.extendedLunchSchedule)
        let extendedBreakSchedule = alarmModel.turnDatesIntoDateComponet(scheduleDictionary: alarmModel.extendedBreakSchedule)
        let rallySchedule = alarmModel.turnDatesIntoDateComponet(scheduleDictionary: alarmModel.rallySchedule)
        let mimimumSchedule = alarmModel.turnDatesIntoDateComponet(scheduleDictionary: alarmModel.minimumSchedule)

        // Array of type ScheduleModels
        var data = [ScheduleModel]()
        data.append(ScheduleModel(scheduleName: "Regular", schedule: regularSchedule))
        data.append(ScheduleModel(scheduleName: "Late Start", schedule: lateStartSchedule))
        data.append(ScheduleModel(scheduleName: "Ext. Lunch", schedule: extendedLunchSchedule))
        data.append(ScheduleModel(scheduleName: "Ext. Break", schedule: extendedBreakSchedule))
        data.append(ScheduleModel(scheduleName: "Rally", schedule: rallySchedule))
        data.append(ScheduleModel(scheduleName: "Minimum", schedule: mimimumSchedule))

        /* data.append(ScheduleModel(scheduleName: "Regular", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:36-10:41", breakPeriod: "10:41-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date"))
         data.append(ScheduleModel(scheduleName: "Late Start", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:31", breakPeriod: "10:31-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date"))
         data.append(ScheduleModel(scheduleName: "Ext. Lunch", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:31", breakPeriod: "10:31-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date"))
         data.append(ScheduleModel(scheduleName: "Ext. Break", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:31", breakPeriod: "10:31-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date"))
         data.append(ScheduleModel(scheduleName: "Rally", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:31", breakPeriod: "10:31-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date"))
         data.append(ScheduleModel(scheduleName: "Minimum", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:31", breakPeriod: "10:31-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date"))
         data.append(ScheduleModel(scheduleName: "Final Exam", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:31", breakPeriod: "10:31-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date")) */

        return data
    }
}
