//
//  chooseViewController.swift
//  HealtyApp
//
//  Created by Marco Caliò on 03/09/2020.
//  Copyright © 2020 Marco Caliò. All rights reserved.
//

import UIKit

class chooseViewController: UIViewController {
    var foods : [Food] = []
    @IBOutlet weak var tableView: UITableView!
    private var sumMacro : Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title="Cosa hai mangiato 😋"
        tableView.delegate=self
        tableView.dataSource=self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
    let button1 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(doSomething))
    let button2 = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(doSomething2))
        
     navigationItem.rightBarButtonItems = [button1, button2]
    }
        @objc
        func doSomething() {
            performSegue(withIdentifier: "addFood", sender: nil)
        }
    
    @objc
    func doSomething2() {
        performSegue(withIdentifier: "chooseApi", sender: nil)
    }

}

extension chooseViewController : UITableViewDelegate, UITableViewDataSource {
    
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
        UIView.animate(withDuration: 0.5) {
            progress.setProgress(Float((value/self.sumMacro)), animated: true)
        }
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

            }
        }
    }
