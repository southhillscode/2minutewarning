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
        var date: String
        var period0: String
        var period1: String
        var period2: String
        var period3: String
        var period4: String
        var period5: String
        var period6: String
        var period7: String
    
    init(scheduleName:String, period0: String, period1: String, period2: String, period3: String,period4: String, period5: String, period6: String, period7: String, date: String) {
        
        self.scheduleName = scheduleName
        self.period0 = period0
        self.period1 = period1
        self.period2 = period2
        self.period3 = period3
        self.period4 = period4
        self.period5 = period5
        self.period6 = period6
        self.period7 = period7
        self.date = date
    }
}
