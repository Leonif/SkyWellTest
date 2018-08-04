//
//  CoupleCell.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/4/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import UIKit
import Foundation

class CoupleCell: UITableViewCell, NibLoadableReusable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
  
    @IBOutlet weak var titleLabel2: UILabel!
    @IBOutlet weak var infoLabel2: UILabel!
    
    
    func bind(info: (title: String, info: String), info2: (title: String, info: String)) {
        
        titleLabel.text = info.title
        infoLabel.text = info.info
        
        titleLabel2.text = info2.title
        infoLabel2.text = info2.info
        
    }
    
}
