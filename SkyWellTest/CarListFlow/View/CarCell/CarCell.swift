//
//  CarCell.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/3/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell, NibLoadableReusable {
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var carPriceLabel: UILabel!
    
    func bind(car: CarInfo) {
        self.carImageView.image = car.image
        self.carNameLabel.text = car.title
        self.carPriceLabel.text = String(format:"%.0f", car.price)
    }
    
}
