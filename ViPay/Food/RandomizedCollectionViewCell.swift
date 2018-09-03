//
//  RandomizedCollectionViewCell.swift
//  ViPay
//
//  Created by Rock on 2018/8/24.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class RandomizedCollectionViewCell: UICollectionViewCell {
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "burger")
        imageView.layer.cornerRadius = 2
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        self.addSubview(thumbnailImageView)
        
        MyConstraints.sharedInstance.pinConstraints(motherView: self, viewToPin: thumbnailImageView, leftMargin: 5, rightMargin: 5, topMargin: 5, bottomMargin: 5)
    }
}
