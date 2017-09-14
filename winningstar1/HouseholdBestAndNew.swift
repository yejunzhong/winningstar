//
//  HouseholdBestAndNew.swift
//  winningstar1
//
//  Created by 叶俊中 on 2017/9/1.
//  Copyright © 2017年 叶俊中. All rights reserved.
//

import UIKit

class HouseholdBestAndNew: UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var householdHotView : GoodsCollectionView?
    var householdNewView : GoodsCollectionView?
    override func draw(_ rect: CGRect) {
        self.isPagingEnabled = true
        self.bounces = false
        self.showsHorizontalScrollIndicator = false
        let layout1 = UICollectionViewFlowLayout()
        layout1.itemSize = CGSize(width:(rect.width - 35) / 2 ,height:rect.width - 35)
        //列间距,行间距,偏移
        layout1.minimumInteritemSpacing = 15
        layout1.minimumLineSpacing = 10
        layout1.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        let hotRect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
        householdHotView = GoodsCollectionView(frame: hotRect, collectionViewLayout: layout1, goodsDS: HouseholdHotDataSource())
        self.addSubview(householdHotView!)
        let newRect = CGRect(x: rect.width, y: 0, width: rect.width, height: rect.height)
        let layout2 = UICollectionViewFlowLayout()
        layout2.itemSize = CGSize(width:(rect.width - 35) / 2 ,height:rect.width - 35)
        //列间距,行间距,偏移
        layout2.minimumInteritemSpacing = 15
        layout2.minimumLineSpacing = 10
        layout2.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        householdNewView = GoodsCollectionView(frame: newRect, collectionViewLayout: layout2, goodsDS: HouseholdNewDataSource())
        self.addSubview(householdNewView!)
        //print("done")
    }
    func goHotView() {
        let point = CGPoint(x: 0, y: 0)
        self.setContentOffset(point, animated: false)
    }
    func goNewView() {
        let point = CGPoint(x: self.bounds.width, y:0 )
        self.setContentOffset(point, animated: false)
    }

}
