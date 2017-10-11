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
    var currentSchedule:[Int:String]
    
    
    
    init(scheduleName:String, schedule:[Int:String]) {
        currentSchedule = schedule
        self.scheduleName = scheduleName
        
    }
    
    func getScheduleName() -> String {
        return self.scheduleName
    }
    
  
}
