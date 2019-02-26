//
//  ViewController.swift
//  FrogClock
//
//  Created by Robert Dodson on 2/24/19.
//  Copyright © 2019 Robert Dodson. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet var clock: ClockButton!
    
    var stop: Bool
    
    
    required init?(coder: NSCoder)
    {
         stop = false
        
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        stop = false
    }
    
    
    func startTimer()
    {
        stop = false
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true)
        { (timer) in
            
            self.clock.setNeedsDisplay()
            if (self.stop)
            {
                timer.invalidate()
            }
        }
    }

    
    func stopTimer()
    {
        stop = true
    }
    
}

