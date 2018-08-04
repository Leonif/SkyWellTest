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
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var engineLabel: UILabel!
    @IBOutlet weak var transmissionLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var descritionTextView: UITextView!
    
    
    
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
        self.subscribeOnViewModel()
    }
    
    func subscribeOnViewModel() {
        self.addNewCarViewModel.onSaved = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        self.addNewCarViewModel.onError = { [weak self] errorMessage in
            self?.onError(with: errorMessage)
        }
    }
    
    func setupNavigationBar() {
        self.swt_setNavigationTitle(title: "")
        self.addCarButton.addTarget(self, action: #selector(self.createCar), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.addCarButton)
    }
    @objc
    func createCar() {
        let carInfo = CarInfo(title: titleTextField.text ?? "No car name",
                              price: Double(priceTextField.text ?? "0.0") ?? 0.0,
                              engine: "2.0i.e",
                              transmission: TransmissionType.enumFromString(string: self.transmissionLabel.text ?? ""),
                              condition: ConditionType.enumFromString(string: self.conditionLabel.text ?? ""),
                              description: self.descritionTextView.text)
        
        self.addNewCarViewModel.save(car: carInfo)
        
    }
}
