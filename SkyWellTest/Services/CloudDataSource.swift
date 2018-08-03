//
//  CloudDatasource.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation

protocol CloudDataSource {
    func fetchWeather(for coords: (Double, Double), callback: @escaping (WeatherEntity) -> Void)
}

struct WeatherEntity {
    var city: String
    var temprature: Double
    var description: String
    
    var kelvin: Double {
        return temprature
    }
    
    var cesium: Double {
        return kelvin - 273.15
    }
}


class CloudDataSourceImpl: CloudDataSource {
    private var networkManager: NetworkManager!
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchWeather(for coords: (Double, Double), callback: @escaping (WeatherEntity) -> Void) {
        
                let baseUrl = URL(string: "http://api.openweathermap.org/data/2.5/weather")!
                let parameters: [String: Any] = [
                    "lat": coords.0,
                    "lon": coords.1,
                    "APPID": "4a92498353c9514b369ac8651d833537"
                ]
        
        let requestType: RequestType = RequestType(method: .get,
                                                   baseURL: baseUrl,
                                                   parameters: parameters)
        
        self.networkManager.executeHttpRequest(requestType: requestType) { (weatherJSONInfo) in
            guard let weatherDict = weatherJSONInfo as? [String: Any] else { return }
            
            
            guard let city = weatherDict["name"] as? String else { return }
            guard let main = weatherDict["main"] as? [String: Any] else { return }
            guard let temp = main["temp"] as? Double else { return }
            guard let weather = weatherDict["weather"] as? [[String: Any]] else { return }
            guard let firstElement = weather.first,
                let description = firstElement["description"] as? String else { return }
            
            let entity = WeatherEntity(city: city, temprature: temp, description: description)
            
            callback(entity)
        }
    }
}

