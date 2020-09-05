//
//  ApiViewController.swift
//  HealtyApp
//
//  Created by Marco Caliò on 05/09/2020.
//  Copyright © 2020 Marco Caliò. All rights reserved.
//

import UIKit

class ApiViewController: UIViewController {
    
    private var foods : [Food] = [Food(name: "Petto di pollo", calories: 102, protein: 23, carbo: 0, fat: 3, weight: 100), Food(name: "Olio Evo", calories: 90, protein: 0, carbo: 0, fat: 10, weight: 100), Food(name: "Pasta", calories: 250, protein: 11, carbo: 70, fat: 3, weight: 100)]
    private var sumMacro : Double = 0
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        
    }
}
    extension ApiViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "IdCell", for: indexPath)
        let newcell : TableViewCellCustomize = cell as! TableViewCellCustomize
        newcell.nomeAlimento.text=foods[indexPath.row].name + " \(foods[indexPath.row].weight)g"
        newcell.chilocal.text=String(format: " %.1fKcal ", foods[indexPath.row].calories)
        newcell.carboLabel.text=String(format: "%.1fg ", foods[indexPath.row].carbo)
        newcell.proteinLabel.text=String(format: "%.1fg ", foods[indexPath.row].protein)
        newcell.fatLabel.text=String(format: "%.1fg", foods[indexPath.row].fat)
        sumMacro=foods[indexPath.row].fat + foods[indexPath.row].protein + foods[indexPath.row].carbo
        progresBar(progress: newcell.progressFat, value: foods[indexPath.row].fat, wei :foods[indexPath.row].weight)
        progresBar(progress: newcell.progressPro, value: foods[indexPath.row].protein, wei: foods[indexPath.row].weight)
        progresBar(progress: newcell.progressCarbo, value: foods[indexPath.row].carbo, wei: foods[indexPath.row].weight)
    
        return newcell
            
            }
        
        func progresBar(progress : UIProgressView, value : Double, wei : Double)  {
            progress.setProgress(Float((value/self.sumMacro)), animated: false)
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "changeFood", sender: indexPath.row)
    }
    
    /*@IBAction func unwindToList(_ unwindSegue: UIStoryboardSegue) {
        let source = unwindSegue.source as! AddFoodViewController
        foods.insert(Food.init(name: source.sFoodName, calories: source.tcalories, protein: source.tprotein, carbo: source.tcarbo, fat: source.tfat), at: foods.count)
        print(foods)
        tableView.reloadData()
        print("Ricarica")
    }*/
    
    func parseFood(foods : [Food])  {
        self.foods = foods
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is changeValueFoodViewControlelr {
            let passValue = segue.destination as! changeValueFoodViewControlelr
            let index = sender as! Int
            passValue.food_name = foods[index].name
            passValue.calories=foods[index].calories
            passValue.carbo=foods[index].carbo
            passValue.fat=foods[index].fat
            passValue.protein=foods[index].protein
            passValue.position=index
            passValue.oldWeight=foods[index].weight
            passValue.flag=true
            }
        }
    }

