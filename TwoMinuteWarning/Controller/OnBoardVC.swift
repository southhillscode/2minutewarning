//
//  OnBoardVC.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/26/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit

class OnBoardVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func continueTouched(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toMainSegue", sender: self)
    }
}
