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
    
    var string: String {
        switch self {
        case .manual:
            return "manual"
        case .auto:
            return "auto"
        case .none:
            return "none"
        }
    }
    
    static func enumFromString(string: String) -> TransmissionType {
        switch string {
        case "manual":
            return .manual
        case "auto":
            return .auto
        default:
            return .none
        }
    }
}

enum ConditionType: Int {
    case good = 0, bad, excellent, none
    
    var string: String {
        switch self {
        case .good:
            return "good"
        case .bad:
            return "bad"
        case .excellent:
            return "excellent"
        case .none:
            return "none"
        }
    }
    
    static func enumFromString(string: String) -> ConditionType {
        switch string {
        case "good":
            return .good
        case "bad":
            return .bad
        case "excellent":
            return .excellent
        default:
            return .none
        }
    }
    
}



protocol CarModel {
    func fetchAllCars(callback: ([CarEntity]) -> Void)
    func fetchCar(with id: String, callback: (CarEntity)-> Void)
    func saveCar(car: CarInfo, completion: @escaping (Bool) -> Void)
    func removeCar(with id: String)
}

class CarModelImpl: CarModel {
    
    private var localDataSource: CarLocalDataSource!
    
    init(localDataSource: CarLocalDataSource) {
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
