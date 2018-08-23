//
//  FoodDetailsCollectionReusableView.swift
//  ViPay
//
//  Created by Rock on 2018/8/23.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class FoodDetailsCollectionReusableView: UICollectionReusableView {
    
    let backgroundImageView: UIImageView = {
        let v = UIImageView()
        v.image = #imageLiteral(resourceName: "Background")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.isUserInteractionEnabled = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    let profileImageView: UIImageView = {
        let v = UIImageView()
        v.image = #imageLiteral(resourceName: "McDon")
        v.layer.cornerRadius = 4
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.isUserInteractionEnabled = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let favRestaurant: UIImageView = {
        let v = UIImageView()
        v.image = #imageLiteral(resourceName: "liked")
        v.contentMode = .scaleAspectFit
        v.clipsToBounds = true
        v.isUserInteractionEnabled = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        self.addSubview(backgroundImageView)
        self.addSubview(profileImageView)
        self.addSubview(favRestaurant)
        
        
        favRestaurant.centerYAnchor.constraint(equalTo: backgroundImageView.bottomAnchor).isActive = true
        favRestaurant.widthAnchor.constraint(equalToConstant: 20).isActive = true
        favRestaurant.heightAnchor.constraint(equalToConstant: 20).isActive = true
        favRestaurant.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        
        profileImageView.centerYAnchor.constraint(equalTo: backgroundImageView.bottomAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        
        backgroundImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: -200).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
}
