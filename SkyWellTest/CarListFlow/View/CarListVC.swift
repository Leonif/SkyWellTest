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
    
    private let createCarButton: UIButton = {
        let b = UIButton(frame: CGRect.zero)
        let icon = R.image.plus()
        b.setImage(icon, for: .normal)
        b.imageView?.contentMode = .scaleAspectFit
        
        return b
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.dataLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableHeader()
        self.setupAdapter()
        self.subscribeOnViewModel()
        self.setupNavigationBar()
    }
    
    func dataLoad() {
        self.carListViewModel.fetchCarList()
        self.carListViewModel.fetchWeatherInfo()
    }
    
    
    func setupNavigationBar() {
        
        let navLabel = UILabel()
        
        let navTitle = NSMutableAttributedString(string: "Car List", attributes:
            [NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 32)])
        
        navLabel.attributedText = navTitle
        self.navigationItem.titleView = navLabel
            
        navigationController?.navigationBar.barTintColor = UIColor.green
        
        self.createCarButton.addTarget(self, action: #selector(self.createCar), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.createCarButton)
    }
    @objc
    func createCar() {
        self.carListViewModel.addNewCar()
    }
    
    func setupAdapter() {
        self.tableView.delegate = self.adapter
        self.tableView.dataSource = self.adapter
        self.tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        self.tableView.register(CarCell.self)
        
        self.adapter.onRemoveCar = { [weak self] carId in
            self?.carListViewModel.removeCar(with: carId)
        }
        self.adapter.onSelectedCar = { [weak self] carId in
            self?.carListViewModel.showCarDetail(for: carId)
        }
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
        self.tableView.tableHeaderView = self.headerView
    }
}
