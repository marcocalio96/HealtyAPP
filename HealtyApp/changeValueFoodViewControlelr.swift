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
    @IBOutlet weak var change_Protein: UILabel!
    var food_name : String = ""
    var calories : Double = 0.0
    var carbo : Double = 0.0
    var protein : Double = 0.0
    var fat : Double = 0.0
    var position : Int = 0 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=food_name + "  \(position)"
        kcal_Change.text=String(format: " %.1fKcal ", calories)
        carbo_Change.text=String(format: " %.1fg ", carbo)
        change_Fat.text=String(format: " %.1fg ", fat)
        change_Protein.text=String(format: " %.1fg ", protein)
    }
}
