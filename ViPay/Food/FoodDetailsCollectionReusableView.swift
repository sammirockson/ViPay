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
        v.image = #imageLiteral(resourceName: "binbing")
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
    
    let restNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Afro Caussian Resto"
        label.font = UIFont(name: FontNames.OpenSansBold, size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    
    let restoAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "110 street, Bantama, Kumasi. The address should be more"
        label.font = UIFont(name: FontNames.OpenSansRegular, size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    let recentFoodItemsContainerV: RecentFoodItemsContainerView = {
        let v = RecentFoodItemsContainerView(frame: .zero)
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
        self.addSubview(restNameLabel)
        self.addSubview(restoAddressLabel)
        self.addSubview(recentFoodItemsContainerV)
        
        
        
        
        recentFoodItemsContainerV.topAnchor.constraint(equalTo: restoAddressLabel.bottomAnchor, constant: 15).isActive = true
        recentFoodItemsContainerV.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -4).isActive = true
        recentFoodItemsContainerV.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4).isActive = true
        recentFoodItemsContainerV.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        restoAddressLabel.topAnchor.constraint(equalTo: restNameLabel.bottomAnchor, constant: 5).isActive = true
        restoAddressLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        restoAddressLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        restoAddressLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        restNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10).isActive = true
        restNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        restNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        restNameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        favRestaurant.centerYAnchor.constraint(equalTo: backgroundImageView.bottomAnchor).isActive = true
        favRestaurant.widthAnchor.constraint(equalToConstant: 30).isActive = true
        favRestaurant.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
