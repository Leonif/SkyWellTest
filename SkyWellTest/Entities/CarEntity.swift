//
//  CarEntity.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/4/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

struct CarEntity {
    var id: String
    var images: [UIImage]
    var title: String
    var price: Double
    var engine: String
    var transmission: TransmissionType
    var condition: ConditionType
    var descrip: String
}
