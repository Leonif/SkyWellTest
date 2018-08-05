//
//  CarInfo.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/4/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

struct CarInfo {
    let id: String
    let images: [UIImage]
    var title: String
    var price: Double
    var engine: String
    var transmission: TransmissionType
    var condition: ConditionType
    var descrip: String
    
    init(id: String = UUID().uuidString, images: [UIImage], title: String, price: Double, engine: String, transmission: TransmissionType, condition: ConditionType, description: String) {
        self.id = id
        self.images = images
        self.title = title
        self.price = price
        self.engine = engine
        self.transmission = transmission
        self.condition = condition
        self.descrip = description
    }
}
