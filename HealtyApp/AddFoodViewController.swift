//
//  AddFoodViewController.swift
//  HealtyApp
//
//  Created by Marco Caliò on 03/09/2020.
//  Copyright © 2020 Marco Caliò. All rights reserved.
//

import UIKit

class AddFoodViewController: UIViewController {
    
    @IBOutlet weak var foodName: UITextField!
    @IBOutlet weak var calories: UITextField!
    @IBOutlet weak var carbo: UITextField!
    @IBOutlet weak var protein: UITextField!
    @IBOutlet weak var fat: UITextField!
    @IBOutlet weak var weight: UITextField!
    
    var sFoodName : String = ""
    var tcalories = 0.0, tcarbo = 0.0, tprotein = 0.0, tfat : Double = 0.0
    var tweight : Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func aggiungi(_ sender: Any) {
        guard let sFoodNameOptional = foodName.text else {
           fatalError()
        }
        sFoodName=sFoodNameOptional
        tcalories=securityWrap(valueName: calories)
        tcarbo=securityWrap(valueName: carbo)
        tprotein=securityWrap(valueName: protein)
        tfat=securityWrap(valueName: fat)
        tweight=securityWrap(valueName: weight)
        performSegue(withIdentifier: "unwindToHome", sender: nil)
        

    }
    
    func securityWrap(valueName : UITextField) -> Double {
        guard let genericValue = valueName.text else {
            fatalError()
        }
        guard let doubleValue = Double(genericValue) else {
            fatalError()
        }
        return doubleValue
    }
    
}

