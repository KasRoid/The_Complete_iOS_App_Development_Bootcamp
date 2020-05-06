//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        ["Four + Two is equal to Six", "True"],
        ["Three is greater than one", "True"],
        ["Three + Eight is less than Ten", "False"]
    ]
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer && questionNumber + 1 < quiz.count {
            questionNumber += 1
            updateUI()
        }
        else if userAnswer == actualAnswer && questionNumber + 1 == quiz.count {
            questionNumber = 0
            updateUI()
        }
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber][0]
    }
    
}

//questionLabel.numberOfLines = 0
//questionLabel.lineBreakMode = .byClipping
//questionLabel.adjustsFontSizeToFitWidth = true
//questionLabel.minimumScaleFactor = 0.5
//questionLabel.font = UIFont.systemFont(ofSize: 40)
