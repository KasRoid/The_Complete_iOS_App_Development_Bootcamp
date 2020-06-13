//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    let storyBrain = StoryBrain()
    var storyTracker = 0
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: UI
    private func configureUI() {
        choice1Button.tag = 1
        choice2Button.tag = 2
        controlStory()
    }
    
    // MARK: Selectors
    @IBAction func choiceMade(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            storyTracker += 1
        case 2:
            storyTracker += 2
        default:
            print("DEBUG: No Button Action")
            return
        }
        controlStory()
    } 
    
 
    // MARK: Methods
    private func controlStory() {
        let story = storyBrain.controlStory(storyTracker)
        storyLabel.text = story.title
        choice1Button.setTitle(story.choice1, for: .normal)
        choice2Button.setTitle(story.choice2, for: .normal)
    }
}
