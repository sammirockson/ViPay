//
//  HomeCollectionViewCell.swift
//  ViPay
//
//  Created by Rock on 2018/8/3.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    let profileImageView: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "binbing")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 20
        return v
    }()
    
    let profileRingImageView: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "profileRing")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 20
        return v
    }()
    
    let usernameLabel: BaseLabel = {
        let label = BaseLabel()
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 16)
        label.text = "Rockson"
        label.textColor = .black
        label.alpha = 0.8
        return label
    }()
    
    let timeStampLabel: BaseLabel = {
        let label = BaseLabel()
        label.font = UIFont(name: FontNames.OpenSansRegular, size: 12)
        label.text = "Yesterday at 12:35 PM"
        label.textColor = RGB.sharedInstance.requiredColor(r: 157, g: 165, b: 178, alpha: 0.5)
        return label
    }()
    
    let optionsContainerView: BaseUIView = {
        let v = BaseUIView()
        v.backgroundColor = .clear
        return v
    }()
    
    let optionImageView: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "option").imageWithTintColor(color: defaultAppColor)
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    
    let thinTopLine: BaseUIView = {
        let v = BaseUIView()
        v.backgroundColor = RGB.sharedInstance.requiredColor(r: 51, g: 34, b: 211, alpha: 1.0)
        v.alpha = 0.2
        return v
    }()
    
    let thinBottomLine: BaseUIView = {
        let v = BaseUIView()
        v.backgroundColor = RGB.sharedInstance.requiredColor(r: 51, g: 34, b: 211, alpha: 1.0)
        v.alpha = 0.2
        return v
    }()
    
    
    let thinBottomDividerLine: BaseUIView = {
        let v = BaseUIView()
        v.backgroundColor = RGB.sharedInstance.requiredColor(r: 51, g: 34, b: 211, alpha: 1.0)
        v.alpha = 0.2
//            UIColor(white: 0.8, alpha: 0.5)
        return v
    }()
    
    let commentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(#imageLiteral(resourceName: "comment").imageWithTintColor(color: defaultAppColor), for: .normal)
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(#imageLiteral(resourceName: "like").imageWithTintColor(color: defaultAppColor), for: .normal)
        return button
    }()
    
    let likesProfileContainerView: LikesProfileContainerView = {
        let v = LikesProfileContainerView()
        v.backgroundColor = .clear
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
        
        self.addSubview(thinTopLine)
        self.addSubview(thinBottomLine)
        self.addSubview(thinBottomDividerLine)
        self.addSubview(commentButton)
        self.addSubview(likeButton)
        self.addSubview(likesProfileContainerView)
        
        self.addSubview(profileImageView)
        self.addSubview(profileRingImageView)
        self.addSubview(optionsContainerView)
        optionsContainerView.addSubview(optionImageView)
        self.addSubview(usernameLabel)
        self.addSubview(timeStampLabel)
        
        timeStampLabel.leftAnchor.constraint(equalTo: profileRingImageView.rightAnchor, constant: 8).isActive = true
        timeStampLabel.rightAnchor.constraint(equalTo: optionsContainerView.leftAnchor).isActive = true
        timeStampLabel.centerYAnchor.constraint(equalTo: profileRingImageView.centerYAnchor, constant: 10).isActive = true
        timeStampLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        usernameLabel.leftAnchor.constraint(equalTo: profileRingImageView.rightAnchor, constant: 8).isActive = true
        usernameLabel.rightAnchor.constraint(equalTo: optionsContainerView.leftAnchor).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: profileRingImageView.centerYAnchor, constant: -10).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        optionsContainerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        optionsContainerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        optionsContainerView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        optionsContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        
        optionImageView.centerXAnchor.constraint(equalTo: optionsContainerView.centerXAnchor).isActive = true
        optionImageView.centerYAnchor.constraint(equalTo: optionsContainerView.centerYAnchor).isActive = true
        optionImageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        optionImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        profileRingImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        profileRingImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        profileRingImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profileRingImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        likesProfileContainerView.leftAnchor.constraint(equalTo: thinBottomDividerLine.rightAnchor).isActive = true
        likesProfileContainerView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        likesProfileContainerView.topAnchor.constraint(equalTo: thinBottomLine.bottomAnchor).isActive = true
        likesProfileContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        likeButton.leftAnchor.constraint(equalTo: commentButton.rightAnchor, constant: 25).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        likeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
        
        commentButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        commentButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        commentButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
        
        thinBottomDividerLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 120).isActive = true
        thinBottomDividerLine.heightAnchor.constraint(equalToConstant: 50).isActive = true
        thinBottomDividerLine.topAnchor.constraint(equalTo: thinBottomLine.bottomAnchor).isActive = true
        thinBottomDividerLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        thinBottomLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        thinBottomLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        thinBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        thinBottomLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true
        
        thinTopLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        thinTopLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        thinTopLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        thinTopLine.topAnchor.constraint(equalTo: self.topAnchor, constant: 75).isActive = true
        
    }
    
}
