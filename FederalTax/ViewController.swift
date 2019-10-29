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
        
        // Total taxes owed
        var taxOwing = 0.0
        
        // Dollars left to tax
        var dollarsLeftToTax = givenGrossIncomeAsDouble
        
        // Determine taxes owed
        switch givenGrossIncomeAsDouble {
        case 210371...:
            let dollarsToTaxAtThisLevel = dollarsLeftToTax - 210371
            dollarsLeftToTax -= dollarsToTaxAtThisLevel
            taxOwing += dollarsToTaxAtThisLevel * 0.33
            fallthrough
        case 147667...210371:
            let dollarsToTaxAtThisLevel = dollarsLeftToTax - 147667
            dollarsLeftToTax -= dollarsToTaxAtThisLevel
            taxOwing += dollarsToTaxAtThisLevel * 0.29
            fallthrough
        case 95259...147667:
            let dollarsToTaxAtThisLevel = dollarsLeftToTax - 95259
            dollarsLeftToTax -= dollarsToTaxAtThisLevel
            taxOwing += dollarsToTaxAtThisLevel * 0.26
            fallthrough
        case 47630...95259:
            let dollarsToTaxAtThisLevel = dollarsLeftToTax - 47630
            dollarsLeftToTax -= dollarsToTaxAtThisLevel
            taxOwing += dollarsToTaxAtThisLevel * 0.205
            fallthrough
        case 0...47630:
            let dollarsToTaxAtThisLevel = dollarsLeftToTax
            dollarsLeftToTax -= dollarsToTaxAtThisLevel
            taxOwing += dollarsToTaxAtThisLevel * 0.15
        default:
            outputTaxOwingInDollars.text = "Error processing dollar amount given."
        }
        
        // Report taxes owing
        let taxOwingFormatted = String(format: "$%.2f", taxOwing)
        outputTaxOwingInDollars.text = "\(name) your federal tax owing is \(taxOwingFormatted)"
        
        // Report effective tax rate
        let effectiveTaxRate = taxOwing / givenGrossIncomeAsDouble * 100
        let effectiveTaxRateFormatted = String(format: "%.1f", effectiveTaxRate)
        outputEffectiveTaxRate.text = "Effective tax rate is: \(effectiveTaxRateFormatted)%"
        
        
    }
    
}

