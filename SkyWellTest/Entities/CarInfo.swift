//
//  CarInfo.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/4/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation

struct CarInfo {
    let id: String
    var title: String
    var price: Double
    var engine: String
    var transmission: TransmissionType
    var condition: ConditionType
    
    init(id: String = UUID().uuidString, title: String, price: Double, engine: String, transmission: TransmissionType, condition: ConditionType) {
        self.id = id
        self.title = title
        self.price = price
        self.engine = engine
        self.transmission = transmission
        self.condition = condition
    }
}
