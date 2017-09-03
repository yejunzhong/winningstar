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
    override func draw(_ rect: CGRect) {
        self.isPagingEnabled = true
        self.bounces = false
        self.showsHorizontalScrollIndicator = false
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:(rect.width - 35) / 2 ,height:rect.width - 35)
        //列间距,行间距,偏移
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        let rect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
        householdHotView = GoodsCollectionView(frame: rect, collectionViewLayout: layout)
        self.addSubview(householdHotView!)
    }
    

}
