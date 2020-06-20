//
//  SecondViewController.swift
//  HealtyApp
//
//  Created by Marco Caliò on 20/06/2020.
//  Copyright © 2020 Marco Caliò. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backSplashButton (_ sender : UIButton) {
        dismiss(animated: true, completion: nil)
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
