//
//  AddNewCarCell.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/5/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import UIKit

class AddNewCarCell: UICollectionViewCell, NibLoadableReusable {
    var onAddNewPhoto: (() -> Void)?
    
    @IBAction func addNewPhoto() {
        self.onAddNewPhoto?()
    }

}
