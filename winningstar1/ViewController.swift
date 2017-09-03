//
//  ViewController.swift
//  winningstar1
//
//  Created by 叶俊中 on 2017/8/27.
//  Copyright © 2017年 叶俊中. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let topImageScrollView = TopImageScrollView()
    let middleGuideView1 = UIView()
    let middleGuideView2 = UIView()
    let middleGuideView3 = UIView()
    var bottonMainView = BottonMainView()
    var isinit = false
    let mainScrollview = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "WinningStar"
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewdidappear")
        mainScrollview.frame = CGRect(x: 0, y: 64, width: ScreenWidth, height: ScreenHeight - 64)
        self.view.addSubview(mainScrollview)
        //默认为true，App进入后台并恢复后会发生视图错误问题
        self.automaticallyAdjustsScrollViewInsets = false
        //加载顶部图片scrollview
        if !isinit{
        topImageScrollView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 150)
        //self.view.addSubview(topImageScrollView)
        self.mainScrollview.addSubview(topImageScrollView)
        //topImageScrollView.setUI()
        NotificationCenter.default.addObserver(self, selector: #selector(topImageScrollViewUpdata), name: NSNotification.Name(rawValue: "I have got the fucking htmlText"), object: nil)
            isinit = true
        }
        //加载中间导航3图片
        middleGuideView1.frame = CGRect(x: 0, y: topImageScrollView.frame.maxY, width: ScreenWidth/3, height: 50)
        middleGuideView2.frame = CGRect(x: ScreenWidth/3, y: topImageScrollView.frame.maxY, width: ScreenWidth/3, height: 50)
        middleGuideView3.frame = CGRect(x: ScreenWidth*2/3, y: topImageScrollView.frame.maxY, width: ScreenWidth/3, height: 50)
        middleGuideView1.backgroundColor = UIColor.red
        middleGuideView2.backgroundColor = UIColor.blue
        middleGuideView3.backgroundColor = UIColor.brown
        self.mainScrollview.addSubview(middleGuideView1)
        self.mainScrollview.addSubview(middleGuideView2)
        self.mainScrollview.addSubview(middleGuideView3)
        middleGuideView1.isUserInteractionEnabled = true
        middleGuideView2.isUserInteractionEnabled = true
        middleGuideView3.isUserInteractionEnabled = true
        let middleGuideViewGR1 = UITapGestureRecognizer(target: self, action: #selector(bottonMainViewPage1))
        middleGuideView1.addGestureRecognizer(middleGuideViewGR1)
        let middleGuideViewGR2 = UITapGestureRecognizer(target: self, action: #selector(bottonMainViewPage2))
        middleGuideView2.addGestureRecognizer(middleGuideViewGR2)
        let middleGuideViewGR3 = UITapGestureRecognizer(target: self, action: #selector(showUserView))
        middleGuideView3.addGestureRecognizer(middleGuideViewGR3)
        
        //加载产品清单页
        
        bottonMainView.frame = CGRect(x: 0, y: middleGuideView1.frame.maxY, width: ScreenWidth, height: mainScrollview.frame.height - middleGuideView3.frame.maxY)
        self.mainScrollview.addSubview(bottonMainView)
    }
    func bottonMainViewPage1() {
        bottonMainView.goPage1()
    }
    func bottonMainViewPage2() {
        bottonMainView.goPage2()
    }
    func showUserView() {
        
    }
    
    func topImageScrollViewUpdata() {
        topImageScrollView.upData()
        //bottonMainView.reloadInputViews()
        bottonMainView.view1.householdBestAndNewView.householdHotView?.loaddata()
        
        mainScrollview.contentSize = CGSize(width: 0, height: middleGuideView3.frame.maxY + bottonMainView.view1.householdBestAndNewView.frame.origin.y + (bottonMainView.view1.householdBestAndNewView.householdHotView?.contentSize.height)!)
        
        bottonMainView.frame.size = CGSize(width: bottonMainView.frame.size.width, height: bottonMainView.view1.householdBestAndNewView.frame.origin.y + (bottonMainView.view1.householdBestAndNewView.householdHotView?.contentSize.height)!)
        
        bottonMainView.view1.frame.size = CGSize(width: bottonMainView.frame.size.width, height: bottonMainView.view1.hotRecommendLabel.frame.maxY + (bottonMainView.view1.householdBestAndNewView.householdHotView?.contentSize.height)!)
        bottonMainView.view1.householdBestAndNewView.frame.size = CGSize(width: bottonMainView.frame.size.width, height: (bottonMainView.view1.householdBestAndNewView.householdHotView?.contentSize.height)!)
        
        bottonMainView.view1.householdBestAndNewView.householdHotView?.frame.size = (bottonMainView.view1.householdBestAndNewView.householdHotView?.contentSize)!
        print((bottonMainView.view1.householdBestAndNewView.householdHotView?.contentSize.height)!)
        print((bottonMainView.view1.householdBestAndNewView.householdHotView?.contentSize.width)!)
        
        
        //下载完毕更新界面
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


}

