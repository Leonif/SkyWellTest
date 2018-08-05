//
//  PhotoCollectionView.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/4/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import UIKit

class PhotoCollectionView: UIView, UIScrollViewDelegate {
    
    var slides: [SlideView] = []
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
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
        for i in 0 ..< slides.count {
            scrollView.addSubview(slides[i])
        }
        
    }
    
    func createSlides(photos: [UIImage]) -> [SlideView] {
        let slides = photos.map { (image) -> SlideView in
            let slide: SlideView = SlideView.view()
            slide.imageView.image = image
            slide.imageView.contentMode = .scaleAspectFit
            return slide
        }
        self.pageControl.numberOfPages = slides.count
        return slides
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupSlideScrollView(slides: slides)
    }
    
    func setupSlideScrollView(slides : [SlideView]) {
        scrollView.contentSize = CGSize(width: self.frame.width * CGFloat(slides.count),
                                        height: self.scrollView.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: self.frame.width * CGFloat(i), y: 0, width: self.frame.width, height: self.frame.height)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y != 0 { scrollView.contentOffset.y = 0 }
        
        let pageIndex = Int(round(scrollView.contentOffset.x / self.frame.width))
        self.pageControl.currentPage = pageIndex
    }
    
    
}
