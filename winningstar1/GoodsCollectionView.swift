//
//  GoodsCollectionView.swift
//  winningstar1
//
//  Created by 叶俊中 on 2017/9/1.
//  Copyright © 2017年 叶俊中. All rights reserved.
//

import UIKit
protocol HouseholdDataSource {
    var imageDataArray:NSMutableArray{get}
    var titleArray:NSMutableArray{get}
    var priceArray:NSMutableArray{get}
}
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
    var goodsDataSource : HouseholdDataSource?
    required init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout,goodsDS:HouseholdDataSource) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        self.register(GoodsCellCollectionViewCell.self, forCellWithReuseIdentifier: "goodsCell")
        goodsDataSource = goodsDS
        loaddata()
    }
    func loaddata() {
        imageData = goodsDataSource?.imageDataArray as! [Data]
        title = goodsDataSource?.titleArray as! [String]
        price = goodsDataSource?.priceArray as! [String]
        self.backgroundColor = UIColor(white: 0.95, alpha: 1)
        print(title.count)
        print("title")
        self.reloadData()
        let w = self.bounds.width
        let size = CGSize(width: 0, height: (w - 25) * 5 + 10)
        self.contentSize = size
        self.frame.size = CGSize(width: self.frame.size.width, height: size.height)
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
