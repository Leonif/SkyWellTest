//
//  CloudDatasource.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation

protocol WeatherCloudDataSource {
    func fetchWeather(for coords: (lat: Double, lon: Double), callback: @escaping (WeatherEntity) -> Void)
}

struct WeatherEntity: Decodable {
    struct Weather: Decodable {
        var description: String
    }
    
    struct TempratureInfo: Decodable {
        var temp: Double
        var kelvin: Double {  return temp }
        var cesium: Double {  return kelvin - 273.15 }
    }
    
    var tempratureInfo: TempratureInfo
    var weather: [Weather]
    var city: String
    
    var weatherInfo: Weather {
        return weather.first!
    }
    
    private enum CodingKeys: String, CodingKey {
        case city = "name"
        case tempratureInfo = "main"
        case weather
    }
}

class WeatherCloudDataSourceImpl: WeatherCloudDataSource {
    private var networkManager: NetworkManager!
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchWeather(for coords: (lat: Double, lon: Double), callback: @escaping (WeatherEntity) -> Void) {
        let baseUrl = URL(string: "http://api.openweathermap.org/data/2.5/weather")!
        let parameters: [String: Any] = [
            "lat": coords.lat,
            "lon": coords.lon,
            "APPID": "4a92498353c9514b369ac8651d833537"
        ]
        
        let requestType: RequestType = RequestType(method: .get,
                                                   baseURL: baseUrl,
                                                   parameters: parameters)
        
        self.networkManager.executeHttpRequest(requestType: requestType) { (data) in
            guard let data = data else { return }
            do {
                let entity = try JSONDecoder().decode(WeatherEntity.self, from: data)
                callback(entity)
            } catch let jsonError {
                fatalError(jsonError.localizedDescription)
            }
        }
    }
}
