//
//  HomeHeaderCollectionReusableView.swift
//  ViPay
//
//  Created by Rock on 2018/7/31.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class HomeHeaderCollectionReusableView: UICollectionReusableView {
    
    let backgroundImageV: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "Background")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    
//    let myqrCode: BaseImageView = {
//        let v = BaseImageView(frame: .zero)
//        v.image = #imageLiteral(resourceName: "icon_qr")
//        v.contentMode = .scaleAspectFill
//        v.clipsToBounds = true
//        return v
//    }()
//
//    let scanQrCode: BaseImageView = {
//        let v = BaseImageView(frame: .zero)
//        v.image = #imageLiteral(resourceName: "iconQrscan")
//        v.contentMode = .scaleAspectFill
//        v.clipsToBounds = true
//        return v
//    }()
    
    
    let homeNavBarLabel: BaseLabel = {
        let label = BaseLabel()
        label.font = UIFont(name: FontNames.OpenSansBold, size: 18)
        label.textAlignment = .center
        label.text = "ViPay"
        label.textColor = .white
        return label
    }()
    
    
    let eventsWishLabel: BaseLabel = {
        let label = BaseLabel()
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 15)
        label.textAlignment = .center
        label.text = "We wish you a Happy BirthDay!"
        label.textColor = RGB.sharedInstance.requiredColor(r: 51, g: 34, b: 211, alpha: 1.0)
        label.alpha = 0.8
        return label
    }()
    
    let whatsOnYourMindLabel: BaseLabel = {
        let label = BaseLabel()
        label.font = UIFont(name: FontNames.OpenSansBold, size: 16)
        label.text = "What's on your mind?"
        label.textColor = RGB.sharedInstance.requiredColor(r: 51, g: 34, b: 211, alpha: 1.0)
//            RGB.sharedInstance.requiredColor(r: 155, g: 204, b: 233, alpha: 1.0)
        return label
    }()
    
    let whatsOnYourMind: BaseUIView = {
        let v = BaseUIView()
        v.layer.borderWidth = 0.2
        v.layer.borderColor =  RGB.sharedInstance.requiredColor(r: 51, g: 34, b: 211, alpha: 1.0).cgColor
//            Colors.shadowBlue.cgColor
        v.layer.cornerRadius = 8
        return v
    }()
    
    let uploadImageView: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "iconCamera").imageWithTintColor(color: RGB.sharedInstance.requiredColor(r: 51, g: 34, b: 211, alpha: 1.0))
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    
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
    
    let whatsOnMindContainer: BaseUIView = {
        let v = BaseUIView(frame: .zero)
        v.contentMode = .scaleAspectFill
//        v.backgroundColor = RGB.sharedInstance.requiredColor(r: 4, g: 33, b: 75, alpha: 1.0)
        v.layer.cornerRadius = 8
        v.backgroundColor = .white
        v.layer.borderWidth = 0.2
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.shadowColor =  Colors.shadowBlue.cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        v.layer.shadowRadius = 1
        v.layer.shadowOpacity = 0.1
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
        
        self.addSubview(backgroundImageV)
        self.addSubview(whatsOnMindContainer)
//        self.addSubview(myqrCode)
//        self.addSubview(scanQrCode)
//        self.addSubview(homeNavBarLabel)
        
        whatsOnMindContainer.addSubview(eventsWishLabel)
        whatsOnMindContainer.addSubview(whatsOnYourMind)
        
        whatsOnYourMind.addSubview(uploadImageView)
        whatsOnYourMind.addSubview(profileImageView)
        whatsOnYourMind.addSubview(profileRingImageView)
        whatsOnYourMind.addSubview(whatsOnYourMindLabel)
        
        whatsOnYourMindLabel.rightAnchor.constraint(equalTo: uploadImageView.leftAnchor, constant: -4).isActive = true
        whatsOnYourMindLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        whatsOnYourMindLabel.centerYAnchor.constraint(equalTo: whatsOnYourMind.centerYAnchor).isActive = true
        whatsOnYourMindLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        profileRingImageView.centerYAnchor.constraint(equalTo: whatsOnYourMind.centerYAnchor).isActive = true
        profileRingImageView.leftAnchor.constraint(equalTo: whatsOnYourMind.leftAnchor, constant: 10).isActive = true
        profileRingImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileRingImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        profileImageView.centerYAnchor.constraint(equalTo: whatsOnYourMind.centerYAnchor).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: whatsOnYourMind.leftAnchor, constant: 10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        uploadImageView.rightAnchor.constraint(equalTo: whatsOnYourMind.rightAnchor, constant: -10).isActive = true
        uploadImageView.centerYAnchor.constraint(equalTo: whatsOnYourMind.centerYAnchor).isActive = true
        uploadImageView.widthAnchor.constraint(equalToConstant: 30.6).isActive = true
        uploadImageView.heightAnchor.constraint(equalToConstant: 25.9).isActive = true
        
        whatsOnYourMind.rightAnchor.constraint(equalTo: whatsOnMindContainer.rightAnchor, constant: -15).isActive = true
        whatsOnYourMind.leftAnchor.constraint(equalTo: whatsOnMindContainer.leftAnchor, constant: 15).isActive = true
        whatsOnYourMind.heightAnchor.constraint(equalToConstant: 50).isActive = true
        whatsOnYourMind.topAnchor.constraint(equalTo: whatsOnMindContainer.topAnchor, constant: 20).isActive = true
        
        eventsWishLabel.bottomAnchor.constraint(equalTo: whatsOnMindContainer.bottomAnchor, constant: -20).isActive = true
        eventsWishLabel.rightAnchor.constraint(equalTo: whatsOnMindContainer.rightAnchor, constant: -8).isActive = true
        eventsWishLabel.leftAnchor.constraint(equalTo: whatsOnMindContainer.leftAnchor, constant: 8).isActive = true
        eventsWishLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
//        homeNavBarLabel.rightAnchor.constraint(equalTo: myqrCode.leftAnchor, constant: -8).isActive = true
//        homeNavBarLabel.leftAnchor.constraint(equalTo: scanQrCode.rightAnchor, constant: 8).isActive = true
//        homeNavBarLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
//        homeNavBarLabel.centerYAnchor.constraint(equalTo: scanQrCode.centerYAnchor).isActive = true
        
//        scanQrCode.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
//        scanQrCode.bottomAnchor.constraint(equalTo: whatsOnMindContainer.topAnchor, constant: -90).isActive = true
//        scanQrCode.widthAnchor.constraint(equalToConstant: 26).isActive = true
//        scanQrCode.heightAnchor.constraint(equalToConstant: 26).isActive = true
//
//        myqrCode.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
//        myqrCode.bottomAnchor.constraint(equalTo: whatsOnMindContainer.topAnchor, constant: -90).isActive = true
//        myqrCode.widthAnchor.constraint(equalToConstant: 26).isActive = true
//        myqrCode.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        whatsOnMindContainer.topAnchor.constraint(equalTo: backgroundImageV.bottomAnchor, constant: -70).isActive = true
        whatsOnMindContainer.heightAnchor.constraint(equalToConstant: 140).isActive = true
        whatsOnMindContainer.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        whatsOnMindContainer.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        
        backgroundImageV.topAnchor.constraint(equalTo: self.topAnchor, constant: -300).isActive = true
        backgroundImageV.heightAnchor.constraint(equalToConstant: 500).isActive = true
        backgroundImageV.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        backgroundImageV.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
    }
}
