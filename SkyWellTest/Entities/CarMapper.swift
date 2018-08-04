//
//  CarMapper.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/4/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

class CarMapper {
    func transformObject(input: Car) -> CarEntity {
        
        guard let filePath = input.filePath else { fatalError() }
        
        guard let image = UIImage(contentsOfFile: filePath) else { fatalError() }

        return CarEntity(id: input.id ?? "no id", image: image,
                         title: input.title ?? "No name",
                         price: input.price,
                         engine: input.engine ?? "Uknown",
                         transmission: TransmissionType(rawValue: Int(input.transmission)) ?? .none,
                         condition: ConditionType(rawValue: Int(input.condition)) ?? .none, descrip: input.descrip ?? "No description")
    }
    
    
    
    
    func transformArray(inputArray: [Car]) -> [CarEntity] {
        return inputArray.map { self.transformObject(input: $0) }
    }
}
