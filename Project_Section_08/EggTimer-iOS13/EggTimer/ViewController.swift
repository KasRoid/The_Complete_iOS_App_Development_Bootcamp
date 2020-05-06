//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    let eggTimes = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    var timer : Timer?
    var counter = 0
    var total = 0
    var player: AVAudioPlayer?
    
    @objc func prozessTimer() {
        counter -= 1
        progressBar.progress = Float(counter) / Float(total)
        print(counter)
        if counter == 0 {
            timer?.invalidate()
            mainLabel.text = "DONE"
            playSound()
        }
    }
    
    @IBAction func eggButtonPressed(sender: UIButton) {
        let hardness = sender.currentTitle

        mainLabel.text = "How do you like your eggs?"
        timer?.invalidate()
        progressBar.progress = 1.0
        total = eggTimes[hardness!]!
        
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
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

}
