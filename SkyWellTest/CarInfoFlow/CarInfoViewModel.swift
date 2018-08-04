//
//  CarInfoViewModel.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/4/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation


protocol CarInfoViewModel {
    func fetchCarInfo(with id: String, callback: (CarInfo) -> Void)
}

class CarInfoViewModelImpl: CarInfoViewModel {
    
    private var carModel: CarModel!
    private var mapper: CarEntityMapper = CarEntityMapper()
    
    init(carModel: CarModel) {
        self.carModel = carModel
    }
    
    func fetchCarInfo(with id: String, callback: (CarInfo) -> Void) {
        self.carModel.fetchCar(with: id) { (carEntity) in
            callback(mapper.transformObject(input: carEntity))
        }
    }
}
