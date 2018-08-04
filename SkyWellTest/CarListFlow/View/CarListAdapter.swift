//
//  CarListAdapter.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/3/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

class CarListAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var onRemoveCar: ((String) -> Void)?
    var onSelectedCar: ((String) -> Void)?
    
    var dataSource: [CarInfo] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CarCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        let car = self.dataSource[indexPath.row]
        cell.bind(car: car)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let car = self.getItem(for: indexPath)
        
        self.onSelectedCar?(car.id)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = self.getItem(for: indexPath)
            tableView.update {
                self.remove(item: item)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
    
    func getItem(for indexPath: IndexPath) -> CarInfo {
        return self.dataSource[indexPath.row]
    }

    func remove(item: CarInfo) {
        guard let index = self.dataSource.index(where: { $0.id == item.id  }) else { fatalError("item doesnt exist") }
        self.dataSource.remove(at: index)
        self.onRemoveCar?(item.id)
    }
}
