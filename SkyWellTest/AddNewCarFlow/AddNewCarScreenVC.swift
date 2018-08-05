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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    var photoAdapter: PhotoAdapter!
    
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
        self.setupAdapter()
        self.subscribeOnViewModel()
        self.setupKeyboardObserver()
        
        photoAdapter.carPhotos = [#imageLiteral(resourceName: "car_placeholder"), #imageLiteral(resourceName: "test_car"), #imageLiteral(resourceName: "test_car"),#imageLiteral(resourceName: "test_car"),#imageLiteral(resourceName: "car_placeholder")]
        
        
    }
    
    func setupAdapter() {
        self.collectionView.delegate = self.photoAdapter
        self.collectionView.dataSource = self.photoAdapter
        self.collectionView.register(AlreadyAddedCell.self)
        self.collectionView.register(AddNewCarCell.self)
    }
    
    
    func setupKeyboardObserver() {
        // Observe keyboard change
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc
    func keyboardWillHide(notification: NSNotification) {
        self.scrollView.contentInset.bottom = 0
    }
    
    @objc
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.scrollView.contentInset.bottom = keyboardSize.height
        }
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
        self.addCarButton.isEnabled = false
        
        let carInfo = CarInfo(images:[#imageLiteral(resourceName: "test_car")], title: titleTextField.text ?? "No car name",
                              price: Double(priceTextField.text ?? "0.0") ?? 0.0,
                              engine: "2.0i.e",
                              transmission: TransmissionType.enumFromString(string: self.transmissionLabel.text ?? ""),
                              condition: ConditionType.enumFromString(string: self.conditionLabel.text ?? ""),
                              description: self.descritionTextView.text)
        self.addNewCarViewModel.save(car: carInfo)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}
