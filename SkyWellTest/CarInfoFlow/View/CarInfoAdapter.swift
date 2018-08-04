//
//  CarInfoAdapter.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/4/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

enum InfoType {
    case couple((String, String), (String, String))
    case horizontal(String, String)
    case vertical(String, String)
}

class CarInfoAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {

    var carInfo: CarInfo! {
        didSet {
            self.dataSource = [ .couple(("car:", self.carInfo.title), ("Price:", String(format: "%.0f", carInfo.price))),
                                .horizontal("Engine:", carInfo.engine),
                                .horizontal("Transmission:", carInfo.transmission.string),
                                .horizontal("Condition:", carInfo.condition.string),
                                .vertical("description",carInfo.descrip)
            ]
        }
    }
    private var dataSource: [InfoType] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let infoType = self.dataSource[indexPath.row]
        
        switch infoType {
        case let .couple((title, info), (title2, info2)):
            let cell: CoupleCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.bind(info: (title, info), info2: (title2, info2))
            return cell
        case let .horizontal(title, info):
            let cell: HorizontalCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.bind(title: title, info: info)
            return cell
        case let .vertical(title, info):
            let cell: VerticalCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.bind(title: title, info: info)
            return cell
        }
    }
    
    func getItem(for indexPath: IndexPath) -> InfoType {
        return self.dataSource[indexPath.row]
    }
}
