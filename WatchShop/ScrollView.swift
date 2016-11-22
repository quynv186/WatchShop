//
//  ScrollView.swift
//  WatchShop
//
//  Created by QUYNV on 11/22/16.
//  Copyright © 2016 QUYNV. All rights reserved.
//

import UIKit

class ScrollView: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    
    var photos : [UIImageView] = []
    var pageImages : [String] = []
    var scrollViews : [UIScrollView] = []
    
    var fist = false
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageController.currentPage = currentPage
        pageController.numberOfPages = pageImages.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        if (!fist) {
            fist = true
            let pagesScrollViewSize = scrollView.frame.size
            scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImages.count), height: 0)
            scrollView.contentOffset = CGPoint(x: CGFloat(currentPage) * scrollView.frame.size.width, y: 0)
            
            for i in 0..<pageImages.count {
                let imgView = UIImageView(image: UIImage(named: pageImages[i] + ".jpg"))
                imgView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
                imgView.contentMode = .scaleAspectFit
                
                photos.append(imgView)
                
                let frontScrollView = UIScrollView(frame: CGRect(x: CGFloat(i) * scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
                frontScrollView.delegate = self
                frontScrollView.minimumZoomScale = 1
                frontScrollView.maximumZoomScale = 2
                frontScrollView.isPagingEnabled = true
                frontScrollView.contentSize = imgView.bounds.size
                
                frontScrollView.addSubview(imgView)
                scrollViews.append(frontScrollView)
                
                self.scrollView.addSubview(frontScrollView)
            }
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photos[pageController.currentPage]
    }
    
    func zoomRectForScale(scale : CGFloat, center : CGPoint) {
        var zoomRect = CGRect()
        let scrollViewSize = scrollView.bounds.size
        zoomRect.size.height = scrollViewSize.height / scale
        zoomRect.size.width = scrollViewSize.width / scale
        
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0)
        
        scrollViews[pageController.currentPage] .zoom(to: zoomRect, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x/scrollView.frame.size.width)
    }
    
    
    @IBAction func action_Next(_ sender: UIButton) {
        if (pageController.currentPage >= 0 && pageController.currentPage < photos.count - 1) {
            let page = pageController.currentPage + 1
            scrollView.contentOffset = CGPoint(x: CGFloat(page) * scrollView.frame.size.width, y: 0)
            pageController.currentPage = page
        }
    }
    
    @IBAction func action_Back(_ sender: UIButton) {
        if (pageController.currentPage > 0 && pageController.currentPage <= photos.count) {
            let page = pageController.currentPage - 1
            scrollView.contentOffset = CGPoint(x: CGFloat(page) * scrollView.frame.size.width, y: 0)
            pageController.currentPage = page
        }
    }
    
}
