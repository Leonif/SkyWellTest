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
    @IBOutlet weak var tableView: UITableView!
    var headerView: WeatherView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableHeader()
        self.subscribeOnViewModel()
        self.dataLoad()
        
    }
    
    
    func dataLoad() {
        //        self.carListViewModel.addNewCar()
        //        self.carListViewModel.showCarDetail(for: "12")
        //
//        self.carListViewModel.fetchCarList()
        self.carListViewModel.fetchWeatherInfo()
//
//        
//        self.carListViewModel.save(car: CarInfo(title: "Ferrari"))

        
    }
    
    func subscribeOnViewModel() {
        self.carListViewModel.onFetchedCarList = { carList in
            print(carList)
        }
        
        self.carListViewModel.onFetchedWeatherInfo = { weatherInfo in
            self.headerView.bind(weatherInfo: weatherInfo)
        }
    }
    
    
    func setupTableHeader() {
        self.headerView = WeatherView.view()
        self.tableView.tableHeaderView = self.headerView
    }
}

