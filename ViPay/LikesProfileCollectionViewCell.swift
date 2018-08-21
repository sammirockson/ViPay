//
//  LikesProfileCollectionViewCell.swift
//  ViPay
//
//  Created by Rock on 2018/8/4.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class LikesProfileCollectionViewCell: UICollectionViewCell {
    
    let profileImageView: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "binbing")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 17
        return v
    }()
    
    let profileRingImageView: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "profileRing")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 17
        return v
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(profileImageView)
        self.addSubview(profileRingImageView)
        
        profileRingImageView.widthAnchor.constraint(equalToConstant: 34).isActive = true
        profileRingImageView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        profileRingImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profileRingImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        profileImageView.widthAnchor.constraint(equalToConstant: 34).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
