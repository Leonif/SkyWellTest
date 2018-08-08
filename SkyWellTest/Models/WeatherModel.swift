//
//  WeatherModel.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation


protocol WeatherModel {
    func fetchWeather(for coords: (lat: Double, lon: Double), callback: @escaping (WeatherEntity) -> Void)
}

class WeatherModelImpl: WeatherModel {
    
    private var cloudDataSource: WeatherCloudDataSource!
    
    init(cloudDataSource: WeatherCloudDataSource) {
        self.cloudDataSource = cloudDataSource
    }
    
    func fetchWeather(for coords: (lat: Double, lon: Double), callback: @escaping (WeatherEntity) -> Void) {
        self.cloudDataSource.fetchWeather(for: coords) { (weatherInfo) in
            callback(weatherInfo)
        }
    }
}
