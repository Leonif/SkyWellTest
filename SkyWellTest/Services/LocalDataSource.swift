//
//  LocalDataSource.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/3/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation

protocol LocalDataSource {
    func fetchAllCars(callback: ([CarEntity]) -> Void)
    func fetchCar(with id: String, callback: (CarEntity)-> Void)
    func saveCar(car: CarEntity)
}

struct CarEntity {
    var title: String
}



class LocalDataSourceImpl: LocalDataSource {
    
    private var persistanceManager: PersistanceManager!
    
    init(persistanceManager: PersistanceManager) {
        self.persistanceManager = persistanceManager
    }
    
    func fetchAllCars(callback: ([CarEntity]) -> Void) {
        let cars: [Car] = self.persistanceManager.fetchAllRecords()
        let entityArray = cars.map { CarEntity(title: $0.title ?? "No name") }
        callback(entityArray)
    }
    
    func fetchCar(with id: String, callback: (CarEntity) -> Void) {
        let car: Car = self.persistanceManager.fetchRecord(with: id)
        callback(CarEntity(title: car.title ?? "No name"))
    }
    
    func saveCar(car: CarEntity) {
        self.persistanceManager.saveRecord { (carObject: Car) in
            carObject.title = car.title
        }
    }
    
    
}
