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
        guard let name = givenName.text else {
            outputTaxOwingInDollars.text = "Please enter a name."
            return
        }
        
        if name == "" {
            outputTaxOwingInDollars.text = "Please enter a name."
            return
        }
        
    }
    
}

