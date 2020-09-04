//
//  Exstention.swift
//  HealtyApp
//
//  Created by Marco Caliò on 04/09/2020.
//  Copyright © 2020 Marco Caliò. All rights reserved.
//

import UIKit

extension UIView {
       func setShadow(obj : NSObject){
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            self.layer.shadowRadius = 8
            self.layer.shadowOpacity = 0.5
        }
    }

    
