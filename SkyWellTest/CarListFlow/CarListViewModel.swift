//
//  CarListViewModel.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation

protocol CarListViewModel {
    var onFetchedCarList: (([CarEntity]) -> Void)? { get set }
    var onFetchedWeatherInfo: ((String) -> Void)? { get set }
    
    
    
    func fetchCarList()
    func fetchWeatherInfo()
    func save(car: CarEntity)
    
    func addNewCar()
    func showCarDetail(for id: String)
}

class CarListViewModelImpl: CarListViewModel {
    
    private var weatherModel: WeatherModel!
    private var carModel: CarModel!
    var onFetchedCarList: (([CarEntity]) -> Void)?
    var onFetchedWeatherInfo: ((String) -> Void)?
    
    var router: CarListRouter!
    
    
    init(weatherModel: WeatherModel, carModel: CarModel) {
        
        self.weatherModel = weatherModel
        self.carModel = carModel
        
    }
    
    func fetchWeatherInfo() {
        weatherModel.fetchWeather(for: (35,139)) { [weak self] (weather) in
            self?.onFetchedWeatherInfo?(weather)
        }
    }
    
    func fetchCarList() {
        self.carModel.fetchAllCars { (carList) in
            self.onFetchedCarList?(carList)
        }
    }
    
    func addNewCar() {
        self.router.showAddCarScreen()
    }
    
    
    func showCarDetail(for id: String) {
        self.router.showCarDetailScreen(for: id)
    }
    
    
    func save(car: CarEntity) {
        carModel.saveCar(car: car)
    }
    
}
