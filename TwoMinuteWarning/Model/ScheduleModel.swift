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
<<<<<<< HEAD
    var currentSchedule:[Int:String]
    
    
    
    init(scheduleName:String, schedule:[Int:String]) {
        currentSchedule = schedule
        self.scheduleName = scheduleName
        
=======
    var currentSchedule:[Int:DateComponents]
    
    
    
    init(scheduleName:String, schedule:[Int:DateComponents]) {
        self.scheduleName = scheduleName
        currentSchedule = schedule
>>>>>>> PickerConnection
    }
    
    
    func getScheduleName() -> String {
        return self.scheduleName
    }
    
<<<<<<< HEAD
  
=======
    
    }
>>>>>>> PickerConnection
}

