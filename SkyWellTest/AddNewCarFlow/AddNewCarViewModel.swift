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
    var onError: ((String) -> Void)? { get set }
    func save(car: CarInfo)
    
}

class AddNewCarViewModelImpl: AddNewCarViewModel {
    private var carModel: CarModel!
    var onSaved: (() -> Void)?
    var onError: ((String) -> Void)?
    
    init(carModel: CarModel) {
        self.carModel = carModel
    }
    
    func save(car: CarInfo) {
        guard validation(car: car) else {
            self.onError?("Please fill all fields")
            return
        }
        
        self.carModel.saveCar(car: car, completion: { success in
            if success { self.onSaved?() }
        })
    }
    
    func validation(car: CarInfo) -> Bool {
        guard !car.title.isEmpty        else { return false }
        guard !car.engine.isEmpty       else { return false }
        guard car.price != 0.0          else { return false }
        guard car.transmission != .none else { return false }
        guard car.condition != .none    else { return false }
        
        return true
    }
}
