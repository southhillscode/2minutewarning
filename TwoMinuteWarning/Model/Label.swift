//
//  Label.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/18/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit
// Force master branch
class ScheduleLabel: UILabel {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }

    override var text: String? {
        get {
            return super.text
        }
        set(newText) {
            super.text = newText?.uppercased()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    func commonInit() {
        layer.cornerRadius = bounds.width / 2
        clipsToBounds = true
        textColor = UIColor.black
        text = "Class Notification"
        frame = CGRect(x: 0, y: 0, width: 200, height: 20)
        setProperties(borderWidth: 1.0, borderColor: UIColor.black)
    }

    func setProperties(borderWidth: Float, borderColor: UIColor) {
        layer.borderWidth = CGFloat(borderWidth)
        layer.borderColor = borderColor.cgColor
    }
}
