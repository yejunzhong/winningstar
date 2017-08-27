//
//  TopImageScrollView.swift
//  winningstar1
//
//  Created by 叶俊中 on 2017/8/27.
//  Copyright © 2017年 叶俊中. All rights reserved.
//

import UIKit

class TopImageScrollView: UIScrollView,UIScrollViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var dataSource:TopImageScrollViewDataSource?
    var pageC : UIPageControl?
    var timer :Timer?
    func setUI() {
        //print(1)
        dataSource = TopImageScrollViewDataSource()
        self.delegate = self
        self.isPagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        let _ = self.subviews.map {
            $0.removeFromSuperview()
        }
        self.addImageView(imageArray: (dataSource?.imageUrlArray)!)
        //print(dataSource?.imageUrlArray!)
    }
    //配置scrollview循环滚动
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x == 0 {
            let point = CGPoint(x: scrollView.contentSize.width - 2 * ScreenWidth, y: 0)
            scrollView.setContentOffset(point, animated: false)
        }else if scrollView.contentOffset.x == scrollView.contentSize.width - ScreenWidth {
            let point = CGPoint(x: ScreenWidth, y: 0)
            scrollView.setContentOffset(point, animated: false)
        }
        pageC?.currentPage = Int(scrollView.contentOffset.x / ScreenWidth) - 1
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.removeTimer()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.addTimer()
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x == scrollView.contentSize.width - ScreenWidth {
            let point = CGPoint(x: ScreenWidth, y: 0)
            scrollView.setContentOffset(point, animated: false)
        }
    }
    //给scroll加载图片
    fileprivate func addImageView(imageArray:NSArray){
        for i in 0..<imageArray.count {
            let urlStr = NSURL(string: imageArray[i] as! String)
            let data = NSData(contentsOf:urlStr! as URL)
            let image = UIImage(data: data! as Data)
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: CGFloat(i) * ScreenWidth, y: 0, width: ScreenWidth, height: self.bounds.height)
            self.addSubview(imageView)
        }
        self.contentSize = CGSize(width: CGFloat(imageArray.count) * ScreenWidth, height: 0)
        self.setContentOffset(CGPoint(x:ScreenWidth,y:0), animated: false)
        let rect = CGRect(x: (ScreenWidth - 200)/2, y: self.frame.maxY - 10 , width: 200, height: 10)
        pageC = UIPageControl.init(frame: rect)
        pageC?.backgroundColor = UIColor.clear
        pageC?.numberOfPages = imageArray.count - 2
        pageC?.currentPageIndicatorTintColor = UIColor.red
        pageC?.pageIndicatorTintColor = UIColor.gray
        pageC?.currentPage = 0
        self.superview?.addSubview(pageC!)
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { (timer) in
            self.change(timer: timer)
        })
    }
    //定时翻页scrollview
    fileprivate func change(timer:Timer){
        if pageC?.currentPage == (pageC?.numberOfPages)! - 1 {
            self.setContentOffset(CGPoint(x:(CGFloat(pageC!.numberOfPages + 1)) * ScreenWidth, y:0), animated: true)
            pageC?.currentPage = 0
            //self.setContentOffset(CGPoint(x: ScreenWidth, y:0), animated: false)
        } else if (pageC?.currentPage)! < (pageC?.numberOfPages)! - 1 {
            pageC?.currentPage += 1
            self.setContentOffset(CGPoint(x:(CGFloat(pageC!.currentPage + 1)) * ScreenWidth, y:0), animated: true)
        }
    }
    //定时器
    fileprivate func addTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { (timer) in
            self.change(timer: timer)
        })
    }
    fileprivate func removeTimer() {
        timer?.invalidate()
    }
}
