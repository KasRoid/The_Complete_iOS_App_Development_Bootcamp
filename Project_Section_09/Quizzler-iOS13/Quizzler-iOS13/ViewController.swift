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
    
    let quiz = ["Four plus Two is equal to Six",
                "Three is greater than one",
                "Three + Eight is less than Ten"
    ]
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            updateUI()
        }
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber]
    }
    
}

//questionLabel.numberOfLines = 0
//questionLabel.lineBreakMode = .byClipping
//questionLabel.adjustsFontSizeToFitWidth = true
//questionLabel.minimumScaleFactor = 0.5
//questionLabel.font = UIFont.systemFont(ofSize: 40)
