//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var numberOfPeople: Double = 2
    var billTotal: Double = 0
    var tip: Double =  0.10
    
    var resultBrain = ResultBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    


    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        sender.isSelected = true
        tip = resultBrain.calculateTip(tipChosen: sender.currentTitle ?? "10%")
        
        let buttons = [zeroPctButton,tenPctButton, twentyPctButton]
        buttons.forEach { button in
            if button != sender{
                button!.isSelected = false
                
            }
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {

        splitNumberLabel.text = String(format: "%.0f",sender.value)
        numberOfPeople = Double(sender.value)
        
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        billTotal = Double(billTextField.text!) ?? 0
        resultBrain.calculateResult(billTotal: billTotal, tip: tip, numberOfPeople: numberOfPeople)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amountToPay = resultBrain.getAmountToPay()
            destinationVC.tip =  resultBrain.getTip()
            destinationVC.numberOfPeople =  resultBrain.getNumberOfPeople()
        }
    
}

}
