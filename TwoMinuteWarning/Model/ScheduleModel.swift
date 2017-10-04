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
    var period: String
    var time: String
    
    init(scheduleName:String, period: String, time: String) {
        self.scheduleName = scheduleName
        self.period = period
        self.time = time
    }

    
    func setTime(time: String){
        self.time = time
    }
}
