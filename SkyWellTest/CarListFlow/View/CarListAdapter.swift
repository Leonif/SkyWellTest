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
    
    
    
    
    
    
    
}
