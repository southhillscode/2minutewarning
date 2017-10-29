//
//  Schedule.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/15/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import Foundation

func create8SectionSchedule(periodMinutes: Int,breakMinutes: Int) -> Array<Any> {
    let yourArray = [String]()
    return yourArray
}

func create9SectionSchedule(periodMinutes: Int,brunchMinutes: Int,lunchMinutes: Int) -> Array<Any> {
    let yourArray = [String]()
    return yourArray
}

func create10SectionSchedule(periodMinutes: Int,brunchMinutes: Int,lunchMinutes: Int, rallyMinutes: Int) -> Array<Any> {
    let yourArray = [String]()
    return yourArray
}

struct ScheduleModel {
    
    private var nameOfSchedule: Array<Any>?
    
    private enum Section {
        case EightSections((Int, Int) -> Array<Any>)
        case NineSections((Int, Int, Int) -> Array<Any>)
        case TenSections(((Int, Int, Int, Int) -> Array<Any>))
    }
    
    private var schedules: Dictionary<String,Section> = [
        "Regular" : Section.NineSections(create9SectionSchedule),
        "Late Start" : Section.EightSections(create8SectionSchedule),
        "Rally" : Section.TenSections(create10SectionSchedule)
    ]
    
    mutating func setScheduleOfNotifications(_ schedule: String) {
        if let mySchedule = schedules[schedule] {
            switch mySchedule {
            case .EightSections(let function):
                if nameOfSchedule != nil {
                   nameOfSchedule = function(34, 39)
                }
            case .NineSections(let function):
                if nameOfSchedule != nil {
                    nameOfSchedule = function(52, 10, 35)
                }
            case .TenSections(let function):
                if nameOfSchedule != nil {
                    nameOfSchedule = function(44, 10, 35, 56)
                }
            }
        }
    }
}

