//
//  PhotoAdapter.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/5/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

enum PhotoCellType {
    case photoCell(UIImage)
    case buttonCell
}


class PhotoAdapter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var carPhotos: [UIImage] = [] {
        didSet {
            self.dataSource = carPhotos.map { .photoCell($0) }
            self.dataSource.append(.buttonCell)
        }
    }
    
    private var dataSource: [PhotoCellType] = []
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = self.getItem(for: indexPath)
        
        switch cellType {
            
        case let .photoCell(image):
            let cell: AlreadyAddedCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            cell.imageView.image = image
            
            return cell
        case .buttonCell:
            let cell: AddNewCarCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            return cell
        }
    }
    
    func getItem(for indexPath: IndexPath) -> PhotoCellType {
        return self.dataSource[indexPath.row]
    }
}
