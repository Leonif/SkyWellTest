//
//  LocalDataSource.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/3/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

protocol LocalDataSource {
    func fetchAllCars(callback: ([CarEntity]) -> Void)
    func fetchCar(with id: String, callback: (CarEntity)-> Void)
    func saveCar(car: CarInfo, completion: @escaping (Bool) -> Void)
    func removeCar(with id: String)
}

class LocalDataSourceImpl: LocalDataSource {
    
    private var persistanceManager: PersistanceManager!
    private var mapper: CarMapper = CarMapper()
    
    init(persistanceManager: PersistanceManager) {
        self.persistanceManager = persistanceManager
    }
    
    func fetchAllCars(callback: ([CarEntity]) -> Void) {
        let cars: [Car] = self.persistanceManager.fetchAllRecords()
        let entityArray = self.mapper.transformArray(inputArray: cars)
        callback(entityArray)
    }
    
    func fetchCar(with id: String, callback: (CarEntity) -> Void) {
        let car: Car = self.persistanceManager.fetchRecord(with: id)
        callback(mapper.transformObject(input: car))
    }
    
    
    func saveImage(image: UIImage) -> String {
        // Save imageData to filePath
        
        // Get access to shared instance of the file manager
        let fileManager = FileManager.default
        
        // Get the URL for the users home directory
        let documentsURL =  fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        // Get the document URL as a string
        let documentPath = documentsURL.path
        
        // Create filePath URL by appending final path component (name of image)
        let filePath = documentsURL.appendingPathComponent("car\(UUID().uuidString).png")
        
        
        // Check for existing image data
        do {
            // Look through array of files in documentDirectory
            let files = try fileManager.contentsOfDirectory(atPath: "\(documentPath)")
            for file in files {
                // If we find existing image filePath delete it to make way for new imageData
                if "\(documentPath)/\(file)" == filePath.path {
                    try fileManager.removeItem(atPath: filePath.path)
                }
            }
        } catch {
            print("Could not add image from document directory: \(error)")
        }
        
        // Create imageData and write to filePath
        do {
            if let pngImageData = UIImagePNGRepresentation(image) {
                try pngImageData.write(to: filePath, options: .atomic)
            }
        } catch {
            print("couldn't write image")
        }
        
        return filePath.path
    }
    
    
    func saveCar(car: CarInfo, completion: @escaping (Bool) -> Void) {
        let filePaths = car.images.map { self.saveImage(image: $0) }
        
        self.persistanceManager.saveRecord(saveCode: { (carObject: Car) in
            carObject.id = car.id
            carObject.title = car.title
            carObject.price = car.price
            carObject.engine = car.engine
            carObject.transmission = Int16(car.transmission.rawValue)
            carObject.condition = Int16(car.condition.rawValue)
            carObject.descrip = car.descrip.isEmpty ? "No description" : car.descrip
            carObject.filePaths = filePaths
        }) { (success) in
            completion(success)
        }
    }
    
    func removeCar(with id: String) {
        let car: Car = self.persistanceManager.fetchRecord(with: id)
        self.persistanceManager.removeRecord(for: car)
    }
    
    
}
