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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Aggiungi"

        tableView.delegate=self
        tableView.dataSource=self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
    let button1 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(doSomething))
     navigationItem.rightBarButtonItems = [button1]
    }
        @objc
        func doSomething() {
            performSegue(withIdentifier: "addFood", sender: nil)
        }
    
    func parseFood(food : Food){
        print("funziona?")
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
        let cell=tableView.dequeueReusableCell(withIdentifier: "IdCell", for: indexPath)
        cell.textLabel?.text=foods[indexPath.row].name + "  \(foods[indexPath.row].calories) kcal    C:\(foods[indexPath.row].carbo)    P:\(foods[indexPath.row].protein)    G:\(foods[indexPath.row].fat)"
        return cell
        
        }
    
    @IBAction func unwindToList(_ unwindSegue: UIStoryboardSegue) {
       print("Funziona", #function)
        let source = unwindSegue.source as! AddFoodViewController
        foods.insert(Food.init(name: source.sFoodName, calories: source.tcalories, protein: source.tprotein, carbo: source.tcarbo, fat: source.tfat), at: foods.count)
        print(foods)
        tableView.reloadData()
        print("Ricarica")
    }
    
}
