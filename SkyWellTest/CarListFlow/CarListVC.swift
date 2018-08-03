//
//  ViewController.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import UIKit


class CarListVC: UIViewController, BaseView {
    var carListViewModel: CarListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.carListViewModel.onFetchedCarList = { carList in
            print(carList)
        }
        
        self.carListViewModel.onFetchedWeatherInfo = { weatherInfo in
            print(weatherInfo)
        }
        
//        self.carListViewModel.addNewCar()
//        self.carListViewModel.showCarDetail(for: "12")
//
        self.carListViewModel.fetchCarList()
        self.carListViewModel.fetchWeatherInfo()
        
        
        self.carListViewModel.save(car: CarInfo(title: "Ferrari"))
        
    }

}

