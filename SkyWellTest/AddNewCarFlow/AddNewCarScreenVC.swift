//
//  AddNewCarScreenVC.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit


class AddNewCarScreenVC: UIViewController, BaseView {
    
    @IBOutlet weak var carTitleTextField: UITextField!
    var addNewCarViewModel: AddNewCarViewModel!
    
    private let addCarButton: UIButton = {
        let b = UIButton(frame: CGRect.zero)
        let attributedTitle
            = NSAttributedString(string: "Add Car",
                                 attributes: [
                                    NSAttributedStringKey.foregroundColor: UIColor.white,
                                    NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 32)
                                    ])
        b.setAttributedTitle(attributedTitle, for: .normal)
        return b
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.addNewCarViewModel.onSaved = {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func setupNavigationBar() {
        self.swt_setNavigationTitle(title: "")
        self.addCarButton.addTarget(self, action: #selector(self.createCar), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.addCarButton)
    }
    @objc
    func createCar() {
        let carInfo = CarInfo(title: carTitleTextField.text ?? "No car name", price: 20000, engine: "2.0i.e", transmission: .manual, condition: .good)
        
        self.addNewCarViewModel.save(car: carInfo)
        
    }
}
