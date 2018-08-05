//
//  CarInfoVC.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

class CarInfoVC: UIViewController, BaseView {
    var carId: String!
    var adapter: CarInfoAdapter!
    @IBOutlet weak var tableView: UITableView!
    var carInfoViewModel: CarInfoViewModel!
    var headerView: PhotoCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableHeader()
        self.setupAdapter()
        self.setupNavigationBar()
        self.sunscribeOnViewModel()
    }
    
    func sunscribeOnViewModel() {
        self.carInfoViewModel.fetchCarInfo(with: self.carId) { [weak self] (carInfo) in
            self?.adapter.carInfo = carInfo
            self?.headerView.bind(carInfo.images)
        }
    }
    
    func setupNavigationBar() {
        self.swt_setNavigationTitle(title: "Title")
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.sizeHeaderToFit()
    }
    
    func setupTableHeader() {
        self.headerView = PhotoCollectionView.view()
        self.tableView.tableHeaderView = self.headerView
    }
    
    
    
    func setupAdapter() {
        self.tableView.delegate = self.adapter
        self.tableView.dataSource = self.adapter
        self.tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        self.tableView.register(CoupleCell.self)
        self.tableView.register(HorizontalCell.self)
        self.tableView.register(VerticalCell.self)
    }
    
}
