//
//  ViewController.swift
//  HealtyApp
//
//  Created by Marco Caliò on 20/06/2020.
//  Copyright © 2020 Marco Caliò. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var caloriesOfTheDay: UILabel!
    @IBOutlet weak var carbo: UILabel!
    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var fat: UILabel!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var groupView: UIView!
    
    var totCal = 0.0
    var totCarbo = 0.0
    var totProtein = 0.0
    var totFat = 0.0
    var list_of_food : [Food] = []
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bentornato Marco 💪"
        caloriesOfTheDay.text="0"
        Button.layer.shadowColor = UIColor.black.cgColor
        Button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        Button.layer.shadowRadius = 3
        Button.layer.shadowOpacity = 0.5
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated )
        if(i==0) {
        self.performSegue(withIdentifier: "startSplash", sender: nil)
            i=1;
        }
        let button1 = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(doSomething))
         navigationItem.rightBarButtonItems = [button1]
        
    }
    
    @IBAction func addFood(_ sender: Any) {
        performSegue(withIdentifier: "addFoodViewController", sender: nil)
    }
    
    @objc
    func doSomething() {
        print("fai qualcosa")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is chooseViewController {
            let dest = segue.destination as! chooseViewController
            dest.parseFood(foods: list_of_food)
        }
    }
    
    @IBAction func unwindToHome(_ unwindSegue: UIStoryboardSegue) {
        if let source = unwindSegue.source as? changeValueFoodViewControlelr {
            if let oldfood = source.oldValue {
                if let newFood = source.newValue {
                    if (source.flag){
                        totCal+=newFood.calories
                        totCarbo+=newFood.carbo
                        totProtein+=newFood.protein
                        totFat+=newFood.fat
                        list_of_food.append(newFood)
                        printValue()
                    }
                    else {
                    print(totCal)
                    totCal=totCal-oldfood.calories + newFood.calories
                    totFat=totFat-oldfood.fat + newFood.fat
                    totProtein=totProtein-oldfood.protein + newFood.protein
                    totCarbo=totCarbo-oldfood.carbo + newFood.carbo
                    printValue()
                    list_of_food[source.position] = newFood
                    }
                 }
                
               
            }
        }
        else
        {
            print("ELSE")
            let source = unwindSegue.source as! AddFoodViewController
            updateValue(calories: Double(source.tcalories) , carbo: Double(source.tcarbo) , prot: Double(source.tprotein) , fat: Double(source.tfat),weight: Double(source.tweight), name: source.foodName.text!)
            
        }
    }
    
    func updateValue(calories : Double, carbo : Double, prot : Double, fat : Double, weight : Double, name : String) {
        self.totCal=totCal + adjustWeight(valueGenerics: calories, weight: weight)
        self.totCarbo=totCarbo + adjustWeight(valueGenerics: carbo, weight: weight)
        self.totProtein=totProtein + adjustWeight(valueGenerics: prot, weight: weight)
        self.totFat=totFat + adjustWeight(valueGenerics: fat, weight: weight)
        printValue()
        let Fcalories=adjustWeight(valueGenerics: calories, weight: weight)
        let Fprot=adjustWeight(valueGenerics: prot, weight: weight)
        let Ffat=adjustWeight(valueGenerics: fat, weight: weight)
        let Fcarb=adjustWeight(valueGenerics: carbo, weight: weight)
        list_of_food.insert(Food.init(name: name, calories: Fcalories, protein: Fprot, carbo: Fcarb, fat: Ffat, weight: weight), at: list_of_food.count)
        
    }
    
    func adjustWeight(valueGenerics : Double, weight : Double) -> Double {
        let finalValue = (valueGenerics/100) * weight
        return finalValue
    }
    
    func printValue()  {
        self.caloriesOfTheDay.text!=String(format: "%.1fKcal", self.totCal)
        self.carbo.text!=String(format: "%.1fg", self.totCarbo)
        self.protein.text!=String(format: "%.1fg", self.totProtein)
        self.fat.text!=String(format: "%.1fg", self.totFat)
    }
    
}

