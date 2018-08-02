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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CarInfoVC is opened with \(carId)")
        
    }
    
}
