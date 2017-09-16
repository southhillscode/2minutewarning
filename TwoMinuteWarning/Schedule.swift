//
//  Schedule.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/15/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import Foundation

class Schedule {
    
    let classNotification: Bool
    let breakNotification: Bool
    let dressNotification: Bool
    let schedule: String
    
    init(classNotification:Bool, breakNotification: Bool, dressNotification:Bool, schedule: String) {
    
        self.classNotification = classNotification
        self.breakNotification = breakNotification
        self.dressNotification = dressNotification
        self.schedule = schedule
        
    }
}
