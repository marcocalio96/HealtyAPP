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
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
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
    
    
}

