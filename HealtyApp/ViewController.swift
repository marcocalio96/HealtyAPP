//
//  ViewController.swift
//  HealtyApp
//
//  Created by Marco Caliò on 20/06/2020.
//  Copyright © 2020 Marco Caliò. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var foodUI: UIView!
    @IBOutlet weak var weightUI: UIView!
    @IBOutlet weak var healtUI: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Benvenuto Marco"
        self.foodUI.layer.cornerRadius=20
        self.weightUI.layer.cornerRadius=20
        self.healtUI.layer.cornerRadius=20
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated )
        self.performSegue(withIdentifier: "startSplash", sender: nil)
        let button1 = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(doSomething))
        let button2 = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(doSomething2))
         navigationItem.rightBarButtonItems = [button1, button2]
        
    }
    
    @objc
    func doSomething() {
        print("fai qualcosa")
    }
    
    @objc
    func doSomething2() {
        print("fai qualcosa2")
    }
    
    

}

