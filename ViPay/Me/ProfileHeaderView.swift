//
//  ProfileHeaderView.swift
//  BudiChat
//
//  Created by Rockson on 21/05/2017.
//  Copyright © 2017 RockzAppStudio. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.image = #imageLiteral(resourceName: "binbing")
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.text = "Samuel Rockson"
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 16)
        return label
        
    }()
    
    
//    let backgroundImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.clipsToBounds = true
//        imageView.image = #imageLiteral(resourceName: "BG")
//        return imageView
//        
//    }()
//    
//
    let backgroundBlurView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        return bgView
        
    }()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
      
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews(){
        
        self.addSubview(backgroundBlurView)
        backgroundBlurView.addSubview(profileImageView)
        backgroundBlurView.addSubview(usernameLabel)
//        backgroundBlurView.addSubview(profileImageView)
        
        usernameLabel.rightAnchor.constraint(equalTo: backgroundBlurView.rightAnchor, constant: -8).isActive = true
        usernameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        profileImageView.leftAnchor.constraint(equalTo: backgroundBlurView.leftAnchor, constant: 8).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: backgroundBlurView.centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        backgroundBlurView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        backgroundBlurView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backgroundBlurView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        backgroundBlurView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
//        backgroundImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        backgroundImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
//        
//        
    }
    
}
