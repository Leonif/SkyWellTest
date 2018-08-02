//
//  BaseView.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation


import Foundation
import UIKit

protocol BaseView: class {
    func showLoading(with text: String)
    func hideLoading()
    func onError(with message: String)
    func onError(with message: String, completion: @escaping () -> Void)
}

extension BaseView where Self: UIViewController {
    func showLoading(with text: String) {
        self.view.pb_startActivityIndicator(with: text)
    }
    
    func hideLoading() {
        self.view.pb_stopActivityIndicator()
    }
    
    func onError(with message: String) {
        DispatchQueue.main.async {
            self.alert(message: message)
        }
    }
    
    func onError(with message: String, completion: @escaping () -> Void) {
        self.alert(message: message, okAction: {
            completion()
        })
    }
    
}
