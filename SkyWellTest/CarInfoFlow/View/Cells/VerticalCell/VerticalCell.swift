//
//  VerticalCell.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/4/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import UIKit

class VerticalCell: UITableViewCell, NibLoadableReusable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    func bind(title: String, info: String) {
        self.titleLabel.text = title
        self.infoLabel.text = info
    }
    
}
