//
//  WeatherModel.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation


protocol WeatherModel {
    func fetchWeather(for coords: (Double, Double), callback: (String) -> Void)
}

class WeatherModelImpl: WeatherModel {
    func fetchWeather(for coords: (Double, Double), callback: (String) -> Void) {
        
        //        api.openweathermap.org/data/2.5/weather?lat=35&lon=139&APPID=4a92498353c9514b369ac8651d833537
        
        print("Call API for \(coords)")
        
        callback("15C")
    }
    
}
