//
//  CarListViewModel.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation

protocol CarListViewModel {
    var onFetchedCarList: (([CarInfo]) -> Void)? { get set }
    var onFetchedWeatherInfo: ((WeatherEntity) -> Void)? { get set }
    
    func fetchCarList()
    func save(car: CarInfo, completion: @escaping (Bool) -> Void)
    func removeCar(with id: String)
    func showCarDetail(for id: String)
    
    func fetchWeatherInfo()
    func addNewCar()
}





class CarListViewModelImpl: CarListViewModel {
    
    private var weatherModel: WeatherModel!
    private var carModel: CarModel!
    var onFetchedCarList: (([CarInfo]) -> Void)?
    var onFetchedWeatherInfo: ((WeatherEntity) -> Void)?
    private var mapper: CarEntityMapper = CarEntityMapper()
    
    var router: CarListRouter!
    
    
    init(weatherModel: WeatherModel, carModel: CarModel) {
        
        self.weatherModel = weatherModel
        self.carModel = carModel
        
    }
    
    func fetchWeatherInfo() {
        weatherModel.fetchWeather(for: (50.490520, 30.499028)) { [weak self] (weather) in
            self?.onFetchedWeatherInfo?(weather)
        }
    }
    
    func fetchCarList() {
        self.carModel.fetchAllCars { (carList) in
            self.onFetchedCarList?( mapper.transformArray(inputArray: carList))
        }
    }
    
    func addNewCar() {
        self.router.showAddCarScreen()
    }
    
    
    func showCarDetail(for id: String) {
        self.router.showCarDetailScreen(for: id)
    }
    
    func removeCar(with id: String) {
        carModel.removeCar(with: id)
    }
    
    
    func save(car: CarInfo, completion: @escaping (Bool) -> Void) {
        carModel.saveCar(car: car, completion: { success in
            completion(success)
        })
    }
    
}
