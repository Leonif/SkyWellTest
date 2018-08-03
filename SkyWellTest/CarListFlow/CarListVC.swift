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
    var adapter: CarListAdapter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableHeader()
        self.setupAdapter()
        self.subscribeOnViewModel()
        self.dataLoad()
        
    }
    
    
    func dataLoad() {
        //        self.carListViewModel.addNewCar()
        //        self.carListViewModel.showCarDetail(for: "12")
        //
        self.carListViewModel.fetchCarList()
        self.carListViewModel.fetchWeatherInfo()
//
//        
//        self.carListViewModel.save(car: CarInfo(title: "Ferrari"))
    }
    
    
    func setupAdapter() {
        self.tableView.delegate = self.adapter
        self.tableView.dataSource = self.adapter
        
    }
    
    
    func subscribeOnViewModel() {
        self.carListViewModel.onFetchedCarList = { [weak self] carList in
            self?.adapter.dataSource = carList
            self?.tableView.reloadData()
        }
        
        self.carListViewModel.onFetchedWeatherInfo = { weatherInfo in
            self.headerView.bind(weatherInfo)
        }
    }
    
    
    func setupTableHeader() {
        self.headerView = WeatherView.view()
        self.headerView.autoresizingMask = []
//        self.headerView = self.tableView.tableHeaderView
        self.tableView.tableHeaderView = self.headerView
        
        
        
//        // 1. Setup AutoLayout
//        self.tableView.setTableHeaderView(headerView: self.headerView)
//
//        // 2. First layout update
//        self.tableView.updateHeaderViewFrame()
    }
}







extension UITableView {
    
    /// Set table header view & add Auto layout.
    func setTableHeaderView(headerView: UIView) {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set first.
        self.tableHeaderView = headerView
        
        // Then setup AutoLayout.
        headerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
    }
    
    /// Update header view's frame.
    func updateHeaderViewFrame() {
        guard let headerView = self.tableHeaderView else { return }
        
        // Update the size of the header based on its internal content.
        headerView.layoutIfNeeded()
        
        // ***Trigger table view to know that header should be updated.
        let header = self.tableHeaderView
        self.tableHeaderView = header
    }
}






