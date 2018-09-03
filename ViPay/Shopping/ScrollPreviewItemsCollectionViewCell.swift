//
//  ScrollPreviewItemsCollectionViewCell.swift
//  ViPay
//
//  Created by Rock on 2018/8/25.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class ScrollPreviewItemsCollectionViewCell: UICollectionViewCell {
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "binbing")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(thumbnailImageView)
        
        MyConstraints.sharedInstance.pinConstraints(motherView: self, viewToPin: thumbnailImageView, leftMargin: 0, rightMargin: 0, topMargin: 0, bottomMargin: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
