//
//  CloudDatasource.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation

protocol CloudDataSource {
    func fetchWeather(for coords: (Double, Double), callback: @escaping (String) -> Void)
}

class CloudDataSourceImpl: CloudDataSource {
    private var networkManager: NetworkManager!
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchWeather(for coords: (Double, Double), callback: @escaping (String) -> Void) {
        
        self.networkManager.executeHttpRequest { (weatherInfo) in
            callback(weatherInfo)
        }
        
//        self.networkManager.fetchWeather(for: coords) { (weatherInfo) in
//            callback(weatherInfo)
//        }
    }
}

