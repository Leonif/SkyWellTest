//
//  CarListViewModel.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation

protocol CarListViewModel {
    var onFetchedCarList: (([String]) -> Void)? { get set }
    var onFetchedWeatherInfo: ((String) -> Void)? { get set }
    
    
    func fetchCarList()
    func fetchWeatherInfo()
    
    func addNewCar()
    func showCarDetail(for id: String)
}

class CarListViewModelImpl: CarListViewModel {
    
    private var weatherModel: WeatherModel!
    var onFetchedCarList: (([String]) -> Void)?
    var onFetchedWeatherInfo: ((String) -> Void)?
    
    var router: CarListRouter!
    
    
    init(weatherModel: WeatherModel) {
        
        self.weatherModel = weatherModel
        
    }
    
    func fetchWeatherInfo() {
        weatherModel.fetchWeather(for: (35,139)) { [weak self] (weather) in
            self?.onFetchedWeatherInfo?(weather)
        }
    }
    
    func fetchCarList() {
        let carList: [String] = ["Ferrari", "Mazzeratti"]
        self.onFetchedCarList?(carList)
    }
    
    func addNewCar() {
        self.router.showAddCarScreen()
    }
    
    
    func showCarDetail(for id: String) {
        self.router.showCarDetailScreen(for: id)
    }
    
}
