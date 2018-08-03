//
//  AddNewCarViewModel.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/3/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation

protocol AddNewCarViewModel {
    var onSaved: (() -> Void)? { get set }
    func save(car: CarInfo)
}

class AddNewCarViewModelImpl: AddNewCarViewModel {
    private var carModel: CarModel!
    var onSaved: (() -> Void)?
    
    init(carModel: CarModel) {
        self.carModel = carModel
    }
    
    func save(car: CarInfo) {
        self.carModel.saveCar(car: car, completion: { success in
            if success { self.onSaved?() }
        })
    }
}
