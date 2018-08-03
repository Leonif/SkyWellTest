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
    func saveCar(car: CarInfo, completion: @escaping (Bool) -> Void)
    func removeCar(with id: String)
}

struct CarEntity {
    var id: String
    var title: String
}



class LocalDataSourceImpl: LocalDataSource {
    
    private var persistanceManager: PersistanceManager!
    
    init(persistanceManager: PersistanceManager) {
        self.persistanceManager = persistanceManager
    }
    
    func fetchAllCars(callback: ([CarEntity]) -> Void) {
        let cars: [Car] = self.persistanceManager.fetchAllRecords()
        let entityArray = cars.map { CarEntity(id: $0.id ?? "no id", title: $0.title ?? "No name") }
        callback(entityArray)
    }
    
    func fetchCar(with id: String, callback: (CarEntity) -> Void) {
        let car: Car = self.persistanceManager.fetchRecord(with: id)
        callback(CarEntity(id: car.id ?? "no id", title: car.title ?? "No name"))
    }
    
    func saveCar(car: CarInfo, completion: @escaping (Bool) -> Void) {
        
        self.persistanceManager.saveRecord(saveCode: { (carObject: Car) in
            carObject.id = car.id
            carObject.title = car.title
        }) { (success) in
            completion(success)
        }
    }
    
    func removeCar(with id: String) {
        let car: Car = self.persistanceManager.fetchRecord(with: id)
        self.persistanceManager.removeRecord(for: car)
    }
    
    
}
