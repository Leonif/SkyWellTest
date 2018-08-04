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
            self.dataSource = [ .couple(("car:", self.carInfo.title), ("Price:", "20000$")),
                                .horizontal("Engine:", "20i.e"),
                                .horizontal("Transmission:", "manual"),
                                .horizontal("Condition:", "good"),
                                .vertical("description","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five cen- turies, but also the leap into electronic typeset- ting, remaining essentially unchanged. It was popularised in the 1960s with the release of Let- raset sheets containing Lorem Ipsum passages, and more recently with desktop publishing soft-")
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
