//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Doyoung Song on 6/15/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var totalLabelText: String?
    var settingLabelText: String?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalLabelText
        settingsLabel.text = settingLabelText
    }
    
    // MARK: - Actions
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
