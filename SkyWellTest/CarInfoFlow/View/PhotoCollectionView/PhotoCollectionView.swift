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
    
    var slides: [SlideView] = []
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.scrollView.delegate = self
    }
    
    class func view() -> PhotoCollectionView {
        let v = Bundle.main.loadNibNamed("PhotoCollectionView", owner: nil)?.first as! PhotoCollectionView
        return v
    }
    func bind(_ photos: [UIImage]) {
        slides = createSlides(photos: photos)
        setupSlideScrollView(slides: slides)
    }
    
    
    func createSlides(photos: [UIImage]) -> [SlideView] {
        let slides = photos.map { (image) -> SlideView in
            let slide: SlideView = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
            slide.imageView.image = image
            slide.imageView.contentMode = .scaleAspectFit
            return slide
        }
        return slides
    }
    
    func setupSlideScrollView(slides : [SlideView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        scrollView.contentSize = CGSize(width: self.frame.width * CGFloat(slides.count), height: self.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: self.frame.width * CGFloat(i), y: 0, width: self.frame.width, height: self.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
}


extension PhotoCollectionView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x

//        let percentage: CGFloat = currentHorizontalOffset / maximumHorizontalOffset

        let pageIndex = Int(round(scrollView.contentOffset.x / self.frame.width))
        
        print(pageIndex)


    }
}









