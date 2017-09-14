//
//  TopImageScrollView.swift
//  winningstar1
//
//  Created by 叶俊中 on 2017/8/27.
//  Copyright © 2017年 叶俊中. All rights reserved.
//

import UIKit
import Kingfisher

class TopImageScrollView: UIScrollView,UIScrollViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var dataSource:NSMutableArray?
    var pageC : UIPageControl?
    var timer :Timer?
    var timerflage = false
    override func draw(_ rect: CGRect) {
        dataSource = TopImageScrollViewDataSource().imageUrlArray
        self.delegate = self
        self.isPagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.bounces = false
        self.addImageView(imageArray: dataSource!)
    }
    func upData() {
        print("upData")
        dataSource = TopImageScrollViewDataSource().imageUrlArray
        print("getdataSource")
        let _ = self.subviews.map {
            $0.removeFromSuperview()
        }
        print("remove")
        self.addImageView(imageArray: dataSource!)
        print("addsource")
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
        if timerflage{
        self.removeTimer()
            timerflage = false
        }
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !timerflage{
        self.addTimer()
            timerflage = true
        }
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x == scrollView.contentSize.width - ScreenWidth {
            let point = CGPoint(x: ScreenWidth, y: 0)
            scrollView.setContentOffset(point, animated: false)
        }
    }
    //给scroll加载图片
    //extension UIImageView:
    fileprivate func addImageView(imageArray:NSArray){
        for i in 0..<imageArray.count {
            //let image = UIImage(data: imageArray[i] as! Data)
            let url = URL(string: imageArray[i] as! String)
            let imageView = UIImageView()
            imageView.kf.setImage(with: url)
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
        if !timerflage{
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { (timer) in
            self.change(timer: timer)
        })
            timerflage = true
        }
    }
    //定时翻页scrollview
    fileprivate func change(timer:Timer){
        if pageC?.currentPage == (pageC?.numberOfPages)! - 1 {
            self.setContentOffset(CGPoint(x:(CGFloat(pageC!.numberOfPages + 1)) * ScreenWidth, y:0), animated: true)
            pageC?.currentPage = 0
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
