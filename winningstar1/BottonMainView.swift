//
//  BottonMainView.swift
//  winningstar1
//
//  Created by 叶俊中 on 2017/8/30.
//  Copyright © 2017年 叶俊中. All rights reserved.
//

import UIKit

class BottonMainView: UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
     */
    let view1 = HouseholdGoodsView()
    let view2 = ElectronicGoodsView()

    override func draw(_ rect: CGRect) {
        print(1)
                view1.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
        view2.frame = CGRect(x: ScreenWidth, y: 0, width: rect.width, height: rect.height)
        view1.backgroundColor = UIColor.green
        view2.backgroundColor = UIColor.brown
        self.addSubview(view1)
        self.addSubview(view2)
        self.contentSize = CGSize(width: rect.width * 2, height: 0)
        //self.isPagingEnabled = true
        print(2)
        self.showsHorizontalScrollIndicator = false
        self.isScrollEnabled = false
        self.bounces = false
        print(3)
    }
    func goPage1() {
        let page1Point = CGPoint(x: 0, y: 0)
        self.setContentOffset(page1Point, animated: false)
    }
    func goPage2() {
        let page2Point = CGPoint(x: self.bounds.width, y: 0)
        self.setContentOffset(page2Point, animated: false)
    }

}
