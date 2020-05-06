//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    let eggTimes = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    var timer : Timer?
    var counter = 0
    
    @objc func prozessTimer() {
        counter -= 1
        print(counter)
        if counter == 0 {
            timer?.invalidate()
            mainLabel.text = "DONE"
        }
    }
    
    @IBAction func eggButtonPressed(sender: UIButton) {
        mainLabel.text = "How do you like your eggs?"
        timer?.invalidate()
        
        let hardness = sender.currentTitle
        
        if hardness == "Soft" {
            counter = eggTimes[hardness!]!
        }
        else if hardness == "Medium" {
            counter = eggTimes[hardness!]!
            
        }
        else if hardness == "Hard" {
            counter = eggTimes[hardness!]!
        }
        timer = Timer.scheduledTimer(timeInterval:1, target:self, selector:#selector(prozessTimer), userInfo: nil, repeats: true)
    }

}
