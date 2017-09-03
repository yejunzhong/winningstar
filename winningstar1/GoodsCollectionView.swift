//
//  GoodsCollectionView.swift
//  winningstar1
//
//  Created by 叶俊中 on 2017/9/1.
//  Copyright © 2017年 叶俊中. All rights reserved.
//

import UIKit

class GoodsCollectionView: UICollectionView,UICollectionViewDataSource,UICollectionViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var imageData = [Data]()
    var title = [String]()
    var price = [String]()
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource = self
        
        self.register(GoodsCellCollectionViewCell.self, forCellWithReuseIdentifier: "goodsCell")
        loaddata()
    }
    func loaddata() {
        let dataSource = HouseholdDataSource()
        imageData = dataSource.hotImageUrlArray as! [Data]
        title = dataSource.titleArray as! [String]
        price = dataSource.priceArray as! [String]
        self.backgroundColor = UIColor(white: 0.95, alpha: 1)
        self.reloadData()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "goodsCell", for: indexPath) as! GoodsCellCollectionViewCell
        if imageData.count>0{
        cell.image.image = UIImage(data: imageData[indexPath.row])
        cell.titleLabel.text = title[indexPath.row]
        cell.priceLabel.text = price[indexPath.row]
        }
        cell.backgroundColor = UIColor.white
        return cell
    }

}
