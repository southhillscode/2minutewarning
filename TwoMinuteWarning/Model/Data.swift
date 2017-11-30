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

        return data
    }
    
    
    
    
}
