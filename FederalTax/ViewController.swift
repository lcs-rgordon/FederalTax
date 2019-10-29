//
//  ViewController.swift
//  FederalTax
//
//  Created by Russell Gordon on 2019-10-28.
//  Copyright © 2019 Russell Gordon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var givenName: UITextField!
    @IBOutlet weak var givenGrossIncome: UITextField!
    @IBOutlet weak var outputTaxOwingInDollars: UILabel!
    @IBOutlet weak var outputEffectiveTaxRate: UILabel!
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Calculate the tax owing
    @IBAction func calculateTax(_ sender: Any) {
        
        // Clear the output boxes from last run
        outputTaxOwingInDollars.text = ""
        outputEffectiveTaxRate.text = ""
        
        // First, get the given name
        let nameError = "Please enter a name."
        guard let name = givenName.text else {
            outputTaxOwingInDollars.text = nameError
            return
        }

        // Do not allow no name to be entered
        if name == "" {
            outputTaxOwingInDollars.text = nameError
            return
        }
        
        // Get the gross income as a String
        let grossIncomeError = "Please enter your gross income in dollars."
        guard let givenGrossIncomeAsString = givenGrossIncome.text else {
            outputTaxOwingInDollars.text = grossIncomeError
            return
        }
        
        // Get the gross income as a Double
        guard let givenGrossIncomeAsDouble = Double(givenGrossIncomeAsString) else {
            outputTaxOwingInDollars.text = grossIncomeError
            return
        }
        

        
    }
    
}

