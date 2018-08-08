//
//  CarInfoAssembler.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

class CarInfoAssembler {
    func assemble() -> UIViewController {
        let persistanceManager = (UIApplication.shared.delegate as? AppDelegate)!.persistanceManager
        let localDataSource = CarLocalDataSourceImpl(persistanceManager: persistanceManager)
        let carModel = CarModelImpl(localDataSource: localDataSource)
        let carInfoViewModel = CarInfoViewModelImpl(carModel: carModel)
        
        let view =  R.storyboard.main.carInfoVC()!
        let adapter = CarInfoAdapter()
        view.adapter = adapter
        view.carInfoViewModel = carInfoViewModel
        return view
    }
    
    
}
