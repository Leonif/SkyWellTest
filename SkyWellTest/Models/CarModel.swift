//
//  CarModel.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/3/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation

enum TransmissionType: Int {
    case manual = 0, auto, none
}

enum ConditionType: Int {
    case good = 0, bad, excellent, none
}



protocol CarModel {
    func fetchAllCars(callback: ([CarEntity]) -> Void)
    func fetchCar(with id: String, callback: (CarEntity)-> Void)
    func saveCar(car: CarInfo, completion: @escaping (Bool) -> Void)
    func removeCar(with id: String)
}

class CarModelImpl: CarModel {
    
    private var localDataSource: LocalDataSource!
    
    init(localDataSource: LocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func fetchAllCars(callback: ([CarEntity]) -> Void) {
        self.localDataSource.fetchAllCars { (carList) in
            callback(carList)
        }
    }
    
    func fetchCar(with id: String, callback: (CarEntity) -> Void) {
        self.localDataSource.fetchCar(with: id) { (carEntity) in
            callback(carEntity)
        }
    }
    
    func saveCar(car: CarInfo, completion: @escaping (Bool) -> Void) {
        self.localDataSource.saveCar(car: car, completion: { success in
            completion(success)
        })
    }
    
    func removeCar(with id: String) {
        self.localDataSource.removeCar(with: id)
    }
    
}
