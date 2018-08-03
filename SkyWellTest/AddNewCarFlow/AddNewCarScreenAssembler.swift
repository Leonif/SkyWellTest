//
//  AddNewCarScreenAssembler.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

class AddNewCarScreenAssembler {
    func assemble() -> UIViewController {
        let persistanceManager = (UIApplication.shared.delegate as? AppDelegate)!.persistanceManager
        
        let localDataSource = LocalDataSourceImpl(persistanceManager: persistanceManager)
        let carModel = CarModelImpl(localDataSource: localDataSource)
        let addNewCarViewModel = AddNewCarViewModelImpl(carModel: carModel)
        
        let view =  R.storyboard.main.addNewCarScreenVC()!
        view.addNewCarViewModel = addNewCarViewModel
        
        return view
    }
}

