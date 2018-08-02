//
//  CarListAssembler.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

class CarListAssembler {
    
    func assemble() -> UIViewController {
        
        let networkManager = (UIApplication.shared.delegate as? AppDelegate)!.networkManager
        
        let cloudDataSource = CloudDataSourceImpl(networkManager: networkManager)
        
        let weatherModel = WeatherModelImpl(cloudDataSource: cloudDataSource)
        
        let carListViewModel = CarListViewModelImpl(weatherModel: weatherModel)
        
        let view =  R.storyboard.main.carListVC()!
        view.carListViewModel = carListViewModel
        
        let router = CarListRouterImpl(view: view)
        carListViewModel.router = router

        return view
    }
}
