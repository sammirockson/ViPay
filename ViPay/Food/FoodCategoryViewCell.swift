//
//  FoodCategoryViewCell.swift
//  ViPay
//
//  Created by Rock on 2018/8/24.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class FoodCategoryViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Fast Food"
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
        
        self.addSubview(iconImageView)
        self.addSubview(titleLabel)
        
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        iconImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        
        
    }
    
}
