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
        let view =  R.storyboard.main.carInfoVC()!
        return view
    }
    
    
}