//
//  OnBoardVC.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/26/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

// lol github test
import UIKit
import NotificationCenter
import UserNotifications

class OnBoardVC: UIViewController {

    var minutes: Int?
    var seconds: TimeInterval?
    var timer: Timer?

    @IBOutlet weak var currentSchedule: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    let alarmModel = MyAlarm()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_: Bool) {

        getTimer()

        // The code below tests for the notification
        //        UNUserNotificationCenter.current().getPendingNotificationRequests { (notification) in
        //            for noti in notification {
        //
        //            }
        //        }
    }

    @IBAction func continueTouched(_: UIButton) {

        performSegue(withIdentifier: "toMain", sender: self)
    }

    @objc func updateTimer() {

        if let actualSeconds = seconds {

            let secs = Int(actualSeconds.truncatingRemainder(dividingBy: 60))

            timeLabel.text = "\(minutes!) minutes and \(secs) seconds"

            seconds! -= 1
            if minutes == 0 && secs == 0 {

                getTimer()
            }
            if secs <= 0 {

                minutes = minutes! - 1
            }
        }
    }

    func getTimer() {

        timer?.invalidate()
        seconds = alarmModel.getTimeUntilNextPeriod(schedule: currentSchedule.text!)

        // If there happens to be an error
        if seconds == 0 {

            timer?.invalidate()

            // If there are no erros
        } else {

            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            minutes = Int(seconds!) / 60
        }
    }
}
