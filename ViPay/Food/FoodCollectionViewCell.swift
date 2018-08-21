//
//  FoodCollectionViewCell.swift
//  ViPay
//
//  Created by Rock on 2018/8/19.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    
    let openClosedLabel: UILabel = {
        let label = UILabel()
        label.text = "Closed"
        label.font = UIFont(name: FontNames.OpenSansRegular, size: 12)
        label.backgroundColor = defaultAppColor
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 3
        label.clipsToBounds = true
        label.alpha = 0.5
        return label
    }()
    
    let distanceLabel: UILabel = {
        let label = UILabel()
        label.text = "2.5Km"
        label.font = UIFont(name: FontNames.OpenSansRegular, size: 12)
        label.textColor = defaultAppColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.alpha = 0.8
        return label
    }()
    
    
    let restaurantProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "McDon")
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.text = "McDonald's"
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let restaurantDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Fast food and general restuarants. Gotta write a lotta stuffs so we will see how it'll wrap up"
        label.font = UIFont(name: FontNames.OpenSansRegular, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    
    let restAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "Location: 256 Bantama, Kumasi."
        label.font = UIFont(name: FontNames.OpenSansRegular, size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()
    
    let thinBottomLine: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(white: 0.8, alpha: 0.5)
        return v
    }()
    
    let ratingsView: UILabel = {
        let label = UILabel()
        label.text = "☻ ☻ ☻ ☻ ☻"
        label.font = UIFont(name: FontNames.OpenSansRegular, size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        self.addSubview(openClosedLabel)
        self.addSubview(thinBottomLine)
        self.addSubview(distanceLabel)
        self.addSubview(restaurantProfileImageView)
        
        self.addSubview(restaurantNameLabel)
        self.addSubview(restaurantDescriptionLabel)
        self.addSubview(restAddressLabel)
        self.addSubview(ratingsView)
        
        ratingsView.leftAnchor.constraint(equalTo: restaurantProfileImageView.rightAnchor, constant: 8).isActive = true
        ratingsView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        ratingsView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ratingsView.topAnchor.constraint(equalTo: self.restAddressLabel.bottomAnchor, constant: 4).isActive = true
        
        restAddressLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        restAddressLabel.leftAnchor.constraint(equalTo: restaurantProfileImageView.rightAnchor, constant: 8).isActive = true
        restAddressLabel.topAnchor.constraint(equalTo: restaurantDescriptionLabel.bottomAnchor, constant: 4).isActive = true
        restAddressLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        restaurantDescriptionLabel.leftAnchor.constraint(equalTo: restaurantProfileImageView.rightAnchor, constant: 8).isActive = true
        restaurantDescriptionLabel.rightAnchor.constraint(equalTo: openClosedLabel.leftAnchor, constant: -8).isActive = true
        restaurantDescriptionLabel.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: 4).isActive = true
        restaurantDescriptionLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        restaurantNameLabel.leftAnchor.constraint(equalTo: restaurantProfileImageView.rightAnchor, constant: 8).isActive = true
        restaurantNameLabel.rightAnchor.constraint(equalTo: openClosedLabel.leftAnchor, constant: -8).isActive = true
        restaurantNameLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        restaurantNameLabel.topAnchor.constraint(equalTo: restaurantProfileImageView.topAnchor).isActive = true
        
        restaurantProfileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        restaurantProfileImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        restaurantProfileImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        restaurantProfileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    
        
        distanceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        distanceLabel.topAnchor.constraint(equalTo: openClosedLabel.bottomAnchor, constant: 8).isActive = true
        distanceLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        distanceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        thinBottomLine.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        thinBottomLine.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        thinBottomLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        thinBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        openClosedLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        openClosedLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        openClosedLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        openClosedLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
}
