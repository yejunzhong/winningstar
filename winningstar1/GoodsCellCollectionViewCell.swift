//
//  GoodsCellCollectionViewCell.swift
//  winningstar1
//
//  Created by 叶俊中 on 2017/9/3.
//  Copyright © 2017年 叶俊中. All rights reserved.
//

import UIKit

class GoodsCellCollectionViewCell: UICollectionViewCell {
    var image = UIImageView()
    var titleLabel = UILabel()
    var priceLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        image.frame = CGRect(x: 5, y: 5, width: frame.width - 10, height: frame.width - 10)
        titleLabel.frame = CGRect(x: 5, y: image.frame.maxY + 5, width: image.frame.width, height: frame.height - image.frame.maxY - 25)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        priceLabel.frame = CGRect(x: 5, y: titleLabel.frame.maxY, width: titleLabel.frame.width, height: 20)
        priceLabel.textAlignment = .center
        self.addSubview(image)
        self.addSubview(titleLabel)
        self.addSubview(priceLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
