//
//  changeValueFoodViewControlelr.swift
//  HealtyApp
//
//  Created by Marco Caliò on 04/09/2020.
//  Copyright © 2020 Marco Caliò. All rights reserved.
//

import UIKit

class changeValueFoodViewControlelr: UIViewController {
    @IBOutlet weak var kcal_Change: UILabel!
    @IBOutlet weak var carbo_Change: UILabel!
    @IBOutlet weak var change_Fat: UILabel!
    @IBOutlet weak var textFieldChange: UITextField!
    @IBOutlet weak var change_Protein: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    var food_name : String = ""
    var calories : Double = 0.0
    var carbo : Double = 0.0
    var protein : Double = 0.0
    var fat : Double = 0.0
    var position : Int = 0
    var oldWeight : Double = 0.0
    var oldValue : Food? = nil
    var newValue : Food? =  nil
    var flag : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=food_name
        oldValue=Food(name: food_name, calories: calories, protein: protein, carbo: carbo, fat: fat, weight: oldWeight )
        showLabel()
    }
    
    func showLabel() {
        kcal_Change.text=String(format: " %.1fKcal ", calories)
        carbo_Change.text=String(format: " %.1fg ", carbo)
        change_Fat.text=String(format: " %.1fg ", fat)
        change_Protein.text=String(format: " %.1fg ", protein)
    }
    
    
   
    @IBAction func valueChange(_ sender: Any) {
        updateValue()
        print("Funziona")
    }
    
    func updateValue()   {
        if let new_weight = Double(String((textFieldChange.text)!))	{
        self.calories=(calories/oldWeight) * new_weight
        self.carbo=(carbo/oldWeight) * new_weight
        self.protein=(protein/oldWeight) * new_weight
        self.fat=(fat/oldWeight) * new_weight
        oldWeight=new_weight
        showLabel()
        }
        
    }
    
    @IBAction func updateValue(_ sender: Any) {
        newValue=Food(name: food_name, calories: calories, protein: protein, carbo: carbo, fat: fat, weight: oldWeight)
        performSegue(withIdentifier: "unwindToAdd", sender: nil)
    }
    
}
