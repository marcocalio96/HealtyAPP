//
//  Food.swift
//  HealtyApp
//
//  Created by Marco Caliò on 03/09/2020.
//  Copyright © 2020 Marco Caliò. All rights reserved.
//

import Foundation
struct Food {
   let name : String
    let calories, protein, carbo, fat, weight: Double
    
    init(name : String, calories : Double, protein : Double, carbo : Double, fat : Double, weight : Double){
        self.name=name
        self.calories=calories
        self.protein=protein
        self.carbo=carbo
        self.fat=fat
        self.weight=weight
        
    }

}

