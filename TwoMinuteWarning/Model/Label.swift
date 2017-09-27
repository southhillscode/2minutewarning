//
//  Label.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/18/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit

//Pull rquest
//Test commit Code Club

class ScheduleLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
        
    }
    
    override var text: String?{
        get{
            return super.text
        }
        set(newText){
            super.text = newText?.uppercased()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit(){
        self.layer.cornerRadius = self.bounds.width/2
        self.clipsToBounds = true
        self.textColor = UIColor.black
        self.text = "Class Notification"
        self.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
        self.setProperties(borderWidth:1.0, borderColor:UIColor.black)
    }
    
    func setProperties(borderWidth: Float, borderColor: UIColor) {
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
    }
    
}
