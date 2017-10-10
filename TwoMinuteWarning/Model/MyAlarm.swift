//
//  MyAlarm.swift
//  TwoMinuteWarning
//
//  Created by Zach Zhong on 06/10/2017.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit
import UserNotifications

//Current date
let date = Date()
let calendar = Calendar.current
let year = calendar.component(.year, from: date)
let month = calendar.component(.month, from: date)
let day = calendar.component(.day, from: date) + 1

class MyAlarm: NSObject {

    let regularSchedule: [Int:String] = [0:"7:40",1:"8:37",2:"9:34",3:"10:31",4:"11:38",5:"12:35",6:"14:07",7:"15:04"]
    let rallySchedule: [Int:String] = [0:"7:40",1:"8:29",2:"9:18",3:"10:07",4:"12:02",5:"12:51",6:"14:15",7:"15:04"]
    let userCalender = Calendar.current

    
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
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: { (error) in
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
      
            
            //Create time component
            let componentsArray = getDateComponentsInOrder(scheduleDictionary: regularSchedule)
            
            //Sort the array so the least time remaining will appear first
            var newArray = componentsArray.sorted(by: {$0.date!.timeIntervalSinceNow < $1.date!.timeIntervalSinceNow})
            
            
            
            //The first one in the array will be next period
            timeInt = newArray[0].date!.timeIntervalSinceNow
            
            
            
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
    
    
}
//Returns the difference between two date
extension DateComponents {
    
    func seconds(from date: DateComponents) -> Int {
        return abs(Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0)
}
}
