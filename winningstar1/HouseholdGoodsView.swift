//
//  HouseholdGoodsView.swift
//  winningstar1
//
//  Created by 叶俊中 on 2017/8/31.
//  Copyright © 2017年 叶俊中. All rights reserved.
//

import UIKit

class HouseholdGoodsView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let householdBestAndNewView = HouseholdBestAndNew()
    let hotRecommendLabel = UILabel()
    let newForYouLabel = UILabel()
    override func draw(_ rect: CGRect) {
        //******titleView*********
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 0, y: 0, width: rect.width, height: 50)
        titleLabel.text = "winningstar goods series"
        titleLabel.textColor = UIColor.white
        titleLabel.backgroundColor = UIColor.gray
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)
        //******imageview、describe*********
        let goodsImageView = UIImageView()
        goodsImageView.frame = CGRect(x: 0, y: titleLabel.frame.maxY, width: rect.width*2/5, height: rect.width*2/5)
        goodsImageView.backgroundColor = UIColor.red
        let goodsDescriptionLabel = UILabel()
        goodsDescriptionLabel.frame = CGRect(x: goodsImageView.frame.maxX, y: goodsImageView.frame.origin.y, width: rect.width - goodsImageView.frame.width, height: goodsImageView.frame.height)
        goodsDescriptionLabel.text = "providing all kinds of househole goods,Get your business started and make your life better."
        goodsDescriptionLabel.lineBreakMode = .byCharWrapping
        goodsDescriptionLabel.numberOfLines = 0
        self.addSubview(goodsImageView)
        self.addSubview(goodsDescriptionLabel)
        //******选择标签*********
        
        hotRecommendLabel.frame = CGRect(x: 0, y: goodsImageView.frame.maxY, width: rect.width/2, height: 50)
        hotRecommendLabel.text = "HOT RECOMMEND"
        hotRecommendLabel.textColor = UIColor.white
        hotRecommendLabel.backgroundColor = UIColor.gray
        hotRecommendLabel.textAlignment = .center
        hotRecommendLabel.isUserInteractionEnabled = true
        let hotRecommendLabelGR = UITapGestureRecognizer(target: self, action: #selector(tapHot))
        hotRecommendLabel.addGestureRecognizer(hotRecommendLabelGR)
        self.addSubview(hotRecommendLabel)
        
        newForYouLabel.frame = CGRect(x: rect.width/2, y: goodsImageView.frame.maxY, width: rect.width/2, height: 50)
        newForYouLabel.text = "NEW FOR YOU"
        newForYouLabel.textColor = UIColor.white
        newForYouLabel.backgroundColor = UIColor.gray
        newForYouLabel.textAlignment = .center
        newForYouLabel.isUserInteractionEnabled = true
        let newForYouLabelGR = UITapGestureRecognizer(target: self, action: #selector(tapNew))
        newForYouLabel.addGestureRecognizer(newForYouLabelGR)
        self.addSubview(newForYouLabel)
        //******产品页*********
        householdBestAndNewView.frame = CGRect(x: 0, y: hotRecommendLabel.frame.maxY, width: rect.width, height: ScreenHeight - 364 - ScreenWidth * 2/5)
        self.addSubview(householdBestAndNewView)
    }
    func tapHot() {
        self.householdBestAndNewView.goHotView()
    }
    func tapNew() {
        self.householdBestAndNewView.goNewView()
    }
}
