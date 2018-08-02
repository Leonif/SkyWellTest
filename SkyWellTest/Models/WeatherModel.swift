//
//  WeatherModel.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation


protocol WeatherModel {
    func fetchWeather(for coords: (Double, Double), callback: @escaping (String) -> Void)
}

class WeatherModelImpl: WeatherModel {
    
    private var cloudDataSource: CloudDataSource!
    
    init(cloudDataSource: CloudDataSource) {
        
        self.cloudDataSource = cloudDataSource
    }
    
    
    func fetchWeather(for coords: (Double, Double), callback: @escaping (String) -> Void) {
        self.cloudDataSource.fetchWeather(for: coords) { (weatherInfo) in
            callback(weatherInfo)
        }
    }
}
