//
//  ViewController.swift
//  FrogClock
//
//  Created by Robert Dodson on 2/24/19.
//  Copyright © 2019 Robert Dodson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var clock: ClockButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.clock.setNeedsDisplay()
        }
    }


}

