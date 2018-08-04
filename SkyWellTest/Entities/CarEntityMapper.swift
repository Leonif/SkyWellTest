//
//  CarEntityMapper.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/4/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation

class CarEntityMapper {
    func transformObject(input: CarEntity) -> CarInfo {
        
        return CarInfo(id: input.id,
                       title: input.title,
                       price: input.price,
                       engine: input.engine,
                       transmission: input.transmission,
                       condition: input.condition, description: input.descrip)
    }
    
    func transformArray(inputArray: [CarEntity]) -> [CarInfo] {
        return inputArray.map { self.transformObject(input: $0) }
    }
}
