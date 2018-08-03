//
//  CarModel.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/3/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation

protocol CarModel {
    func fetchAllCars(callback: ([CarEntity]) -> Void)
    func fetchCar(with id: String, callback: (CarEntity)-> Void)
    func saveCar(car: CarEntity)
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
    
    func saveCar(car: CarEntity) {
        self.localDataSource.saveCar(car: car)
    }
    
}
