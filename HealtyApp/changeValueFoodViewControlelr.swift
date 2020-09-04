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
    @IBOutlet weak var protein_Change: UILabel!
    @IBOutlet weak var fat_change: UILabel!
    var food_name : String = ""
    let calories : Double = 0.0
    let carbo : Double = 0.0
    let protein : Double = 0.0
    let fat : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=food_name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
