//
//  Schedule.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/15/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import Foundation

class ScheduleModel {

    var scheduleName: String
    var currentSchedule: [Int: DateComponents]

    init(scheduleName: String, schedule: [Int: DateComponents]) {
        self.scheduleName = scheduleName
        currentSchedule = schedule
    }

    func getScheduleName() -> String {
        return scheduleName
    }
}
