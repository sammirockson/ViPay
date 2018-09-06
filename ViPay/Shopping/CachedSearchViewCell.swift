//
//  CachedSearchViewCell.swift
//  ViPay
//
//  Created by Rock on 2018/9/4.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit


class CachedSearchViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont(name: FontNames.OpenSansRegular, size: 14)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        
        MyConstraints.sharedInstance.pinConstraints(motherView: self, viewToPin: titleLabel, leftMargin: 4, rightMargin: -4, topMargin: 0, bottomMargin: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
