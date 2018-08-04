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
    
    var carId: String?
    var adapter: CarInfoAdapter!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupAdapter()
        self.setupNavigationBar()
        
        
        print("CarInfoVC is opened with \(carId)")
        
    }
    
    func setupNavigationBar() {
//        let navLabel = UILabel()
//        let navTitle = NSMutableAttributedString(string: "Title", attributes:
//            [NSAttributedStringKey.foregroundColor: UIColor.white,
//             NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 32)])
//
//        navLabel.attributedText = navTitle
//        self.navigationItem.titleView = navLabel
//
//        navigationController?.navigationBar.barTintColor = UIColor(rgb: 0x9AC649)
//        navigationController?.navigationBar.backgroundColor = UIColor(rgb: 0x9AC649)
//        navigationController?.navigationBar.isTranslucent = false
        
        self.swt_setNavigationTitle(title: "Title")
        
        
        
    }
    
    
    
    
    func setupAdapter() {
        self.tableView.delegate = self.adapter
        self.tableView.dataSource = self.adapter
        self.tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        self.tableView.register(CoupleCell.self)
    }
    
}
