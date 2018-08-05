//
//  Slide.swift
//  swipeScrollViewCards
//
//  Created by Leonid Nifantyev on 7/25/18.
//  Copyright © 2018 Leonid Nifantyev. All rights reserved.
//

import Foundation
import UIKit

class SlideView: UIView {
    @IBOutlet weak var imageView: UIImageView!
    
    class func view() -> SlideView {
        let v = Bundle.main.loadNibNamed("SlideView", owner: nil)?.first as! SlideView
        return v
    }
}
