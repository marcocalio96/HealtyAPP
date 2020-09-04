//
//  TableViewCellCustomize.swift
//  HealtyApp
//
//  Created by Marco Caliò on 04/09/2020.
//  Copyright © 2020 Marco Caliò. All rights reserved.
//

import UIKit

class TableViewCellCustomize: UITableViewCell {

   
    @IBOutlet weak var nomeAlimento: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var carboLabel: UILabel!
    @IBOutlet weak var chilocal: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
