//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    lazy var buttons = [zeroPctButton, tenPctButton, twentyPctButton]
    var selectedButton: UIButton?
    var percentage: String?
    var totalForEachPerson: Double = 0
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        tenPctButton.tag = 1
        twentyPctButton.tag = 2
    }
    
    
    // MARK: - Actions
    @IBAction func tipChanged(_ sender: UIButton) {
        sender.isSelected = true
        selectedButton = sender
        buttons.forEach() { if $0 != sender { $0?.isSelected = false } }
        billTextField.endEditing(true)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard billTextField.text?.isEmpty == false else { return }
        let total = Int(billTextField.text ?? "") ?? 0
        let numberOfPeople = Int(splitNumberLabel.text ?? "") ?? 0
        switch selectedButton {
        case zeroPctButton:
            totalForEachPerson = Double(total) / Double(numberOfPeople)
            percentage = "0%"
        case tenPctButton:
            totalForEachPerson = Double(total) * 1.1 / Double(numberOfPeople)
            percentage = "10%"
        case twentyPctButton:
            totalForEachPerson = Double(total) * 1.2 / Double(numberOfPeople)
            percentage = "20%"
        default:
            print("No button is selected")
            return
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    // MARK: - Private Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            print(totalForEachPerson)
            destinationVC.totalLabelText = String(format: "%.2f", totalForEachPerson)
            destinationVC.settingLabelText = "Split between \(splitNumberLabel.text ?? "") people, with \(percentage ?? "") tip."
        }
    }
}

