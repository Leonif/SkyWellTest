//
//  PhotoCollectionView.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/4/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

class PhotoCollectionView: UIView {
    @IBOutlet weak var image: UIImageView!
    
    class func view() -> PhotoCollectionView {
        let v = Bundle.main.loadNibNamed("PhotoCollectionView", owner: nil)?.first as! PhotoCollectionView
        return v
    }
    func bind(_ photos: [UIImage]) {
        self.image.image = photos.first!
    
    }

    
    
}
