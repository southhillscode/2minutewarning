//
//  MyAlarm.swift
//  TwoMinuteWarning
//
//  Created by Zach Zhong on 06/10/2017.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit
import UserNotifications



class MyAlarm: NSObject {
    //Current date
    let year = Calendar.current.component(.year, from: Date())
    let month = Calendar.current.component(.month, from: Date())
    let day = Calendar.current.component(.day, from: Date())
    let regularSchedule: [Int:String] = [0:"7:45",1:"8:37",2:"9:34",3:"10:31",4:"11:38",5:"12:35",6:"12:52",7:"15:04"]
    let lateStartSchedule: [Int:String] = [0:"9:45",1:"10:24",2:"11:03",3:"11:42",4:"12:21",5:"13:39",6:"14:18",7:"14:57"]
    
    let userCalender = Calendar.current
   // data.append(ScheduleModel(scheduleName: "Rally", period0: "7:45-8:37", period1: "8:42-9:34", period2: "9:39-10:31", period3: "10:31", breakPeriod: "10:31-10:41", period4: "10:46-11:38", period5: "11:43-12:35", lunch: "12:35-1:10", period6: "1:15-2:07", period7: "2:12-3:04", date: "My Date"))

    
    func createNotif(year: Int, month: Int, day: Int, hour: Int, minute: Int, identifier: String, content: String) {
        
        //Set up dates
        var dateComponent = DateComponents()
        dateComponent.year = year
        dateComponent.month = month
        dateComponent.day = day
        dateComponent.hour = hour
        dateComponent.minute = minute
        
        //Set up triger, content, id
        let myAlarmTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        let myAlarmID = identifier
        let myAlarmContent = UNMutableNotificationContent()
        myAlarmContent.body = content
        
        
        
        let request = UNNotificationRequest(identifier: myAlarmID, content: myAlarmContent, trigger: myAlarmTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
            if error != nil {
                //TODO: Handle the error
            }
        })
    }
    
    
    func getDifferenceInSeconds(from date:DateComponents, to date2: DateComponents) -> Int {
        
        return date.seconds(from: date2)
        
    }
    
    func clearNotification() {
        
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        
    }
    
    //This turn the schedule into the right format so it can be easier when we set up the notification
    func turnDatesIntoDateComponet(scheduleDictionary: [Int:String]) -> [Int:DateComponents] {
        
        
        var result = [Int:DateComponents]()
        for (period,date) in scheduleDictionary {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "H:mm"
            let formattedDate = dateFormatter.date(from: date)
            let calenderComponet = userCalender.dateComponents([.hour,.minute], from: formattedDate!)
            result[period] = calenderComponet
            
            
            
        }
        return result
    }
    
    
    func getDateComponentsInOrder(scheduleDictionary: [Int:String]) -> [DateComponents] {
        var result = [DateComponents]()
        for (_,date) in scheduleDictionary {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "H:mm"
            let formattedDate = dateFormatter.date(from: date)
            let calenderComponet = userCalender.dateComponents([.hour,.minute,.calendar], from: formattedDate!)
            
            let finalDateComponent = setDateComponentToToday(date: calenderComponet)
            
            
            if finalDateComponent.date!.timeIntervalSinceNow.isLessThanOrEqualTo(0) {
                
                
            } else {
                
                
                result.append(finalDateComponent)

            }
            
            
        }
        
        result = result.sorted(by: {$0.date!.timeIntervalSinceNow < $1.date!.timeIntervalSinceNow})
        
        
        
        
        
        return result
        
    }
    
    
    func getTimeUntilNextPeriod(schedule: String) -> TimeInterval {
        
        var timeInt = TimeInterval()
        
        //Set up the formatter to read dates like 15:03
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm"
        
        switch schedule {
            
        case "Regular":
      
            timeInt = getTimeUntilNextPeriod(scheduleDictionary: regularSchedule)
        
        case "Late Start":
            
            timeInt = getTimeUntilNextPeriod(scheduleDictionary: lateStartSchedule)
            
        default:
            print("\(schedule) is not a valid schedule")
            
            
        }

        
        return timeInt
        
        
    }
    
    
    func setDateComponentToToday(date: DateComponents) -> DateComponents  {
        
        var newDate = date
        newDate.day = day
        newDate.month = month
        newDate.year = year
        
        return newDate
    }
    
    private func getTimeUntilNextPeriod(scheduleDictionary: [Int:String]) -> TimeInterval {
        
        //Create time component
        let componentsArray = getDateComponentsInOrder(scheduleDictionary: scheduleDictionary)
        
        //Sort the array so the least time remaining will appear first
        var newArray = componentsArray.sorted(by: {$0.date!.timeIntervalSinceNow < $1.date!.timeIntervalSinceNow})
        
        
        
        if newArray.count == 0 {
            
            return 0;
            
        }
        //The first one in the array will be next period
        return newArray[0].date!.timeIntervalSinceNow
        
    }
    
    
}
//Returns the difference between two date
extension DateComponents {
    
    func seconds(from date: DateComponents) -> Int {
        return abs(Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0)
}
}
