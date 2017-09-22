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
    var date: Date
    var period0: Int
    var period1: Int
    var period2: Int
    var period3: Int
    var period4: Int
    var period5: Int
    var period6: Int
    var period7: Int
    
    init(scheduleName:String, period0: Int, period1: Int, period2: Int, period3: Int,period4: Int, period5: Int, period6: Int, period7: Int, date: Date) {
        
        self.scheduleName = scheduleName
        self.period0 = period0
        self.period1 = period0
        self.period2 = period0
        self.period3 = period0
        self.period4 = period0
        self.period5 = period0
        self.period6 = period0
        self.period7 = period0
        self.date = date
    }
}
