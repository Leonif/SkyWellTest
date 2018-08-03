//
//  WeatherView.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/3/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

class WeatherView: UIView {
    
    @IBOutlet weak var tempreture: UILabel!
    @IBOutlet weak var condtitions: UILabel!
    @IBOutlet weak var city: UILabel!
    
    class func view() -> WeatherView {
        return Bundle.main.loadNibNamed("WeatherView", owner: nil)?.first as! WeatherView
    }

    func bind(weatherInfo: WeatherEntity) {
        self.city.text = weatherInfo.city
        self.condtitions.text = weatherInfo.description
        let plus = weatherInfo.cesium > 0.0 ? "+" : ""
        self.tempreture.text = String(format: "%@%.0f", plus, weatherInfo.cesium)
    }
}
