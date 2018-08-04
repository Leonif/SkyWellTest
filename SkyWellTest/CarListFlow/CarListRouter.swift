//
//  CarListRouter.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

protocol CarListRouter {
    func showAddCarScreen()
    func showCarDetailScreen(for id: String)
}

class CarListRouterImpl: CarListRouter {
    private weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func showAddCarScreen() {
        let module = AddNewCarScreenAssembler().assemble()
        self.view?.navigationController?.pushViewController(module, animated: true)
    }
    
    func showCarDetailScreen(for id: String) {
        let module = CarInfoAssembler().assemble()
        
        (module as! CarInfoVC).carId = id
        
        self.view?.navigationController?.pushViewController(module, animated: true)
    }
}
