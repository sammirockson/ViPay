//
//  ShopItemDetailReusableView.swift
//  ViPay
//
//  Created by Rock on 2018/8/24.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit
import Parse

class ShopItemDetailReusableView: UICollectionReusableView {
    
    let scrollPreviewItemsContainerView: ScrollPreviewItemsView = {
        let v = ScrollPreviewItemsView()
        v.backgroundColor = .brown
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let priceAndDescription: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let priceLabel: UILabel = {
        let p = UILabel()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.text = "Ghc 99.9"
        p.font = UIFont(name: FontNames.OpenSansBold, size: 24)
        p.textColor = defaultAppColor
        return p
    }()
    
    let descriptionLabel: UITextView = {
        let textV = UITextView()
        textV.dataDetectorTypes = .all
        textV.isScrollEnabled = false
        textV.isEditable = false
        textV.translatesAutoresizingMaskIntoConstraints = false
        textV.font = UIFont(name: FontNames.OpenSansRegular, size: 15)
        textV.text = "hello world"
        return textV
    }()
    
    let commentsContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let commentLabel: UILabel = {
        let p = UILabel()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.text = "500 comments and reviews \nLeave a comment"
        p.font = UIFont(name: FontNames.OpenSansSemiBold, size: 16)
        p.numberOfLines = 0
        return p
    }()
    
    
    let shopContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let shopLogo: UIImageView = {
        let imv = UIImageView()
        imv.translatesAutoresizingMaskIntoConstraints = false
        imv.image = #imageLiteral(resourceName: "binbing")
        imv.layer.cornerRadius = 8
        imv.clipsToBounds = true
        imv.contentMode = .scaleAspectFill
        return imv
    }()
    
    let shopNameLabel: UILabel = {
        let p = UILabel()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.text = "AKAMA STUDIOS"
        p.font = UIFont(name: FontNames.OpenSansBold, size: 16)
        p.numberOfLines = 1
        return p
    }()
    
    let shopLevelLabel: UILabel = {
        let p = UILabel()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.text = "Gold Member"
        p.font = UIFont(name: FontNames.OpenSansSemiBold, size: 14)
        p.textColor = defaultAppColor
        p.numberOfLines = 1
        return p
    }()
    
    let shopRatingsLabel: UILabel = {
        let p = UILabel()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.text = "* * * * *"
        p.font = UIFont(name: FontNames.OpenSansSemiBold, size: 16)
        p.textColor = defaultAppColor
        p.numberOfLines = 1
        return p
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func showSlideItems(product: PFObject){
        
        var arrayOfStrings = [String]()
        
        if let fileOne = product.object(forKey: "fileOne") as? PFFile {
            arrayOfStrings.append(fileOne.url!)
        }
        
        if let fileTwo = product.object(forKey: "fileTwo") as? PFFile {
            arrayOfStrings.append(fileTwo.url!)
        }
        
        if let fileThree = product.object(forKey: "fileThree") as? PFFile {
            arrayOfStrings.append(fileThree.url!)
        }
        
        if let fileFour = product.object(forKey: "fileFour") as? PFFile{
            arrayOfStrings.append(fileFour.url!)
        }
        
        self.scrollPreviewItemsContainerView.productURLS = arrayOfStrings
        self.scrollPreviewItemsContainerView.collectionView.reloadData()
        
        
        let price = product.object(forKey: "price") as? String
        self.priceLabel.text = "Ghc \(price!)"
        
        let descrip = product.object(forKey: "description") as? String
        self.descriptionLabel.text = descrip
        
        

    }
    
    
}

extension ShopItemDetailReusableView{
    func setUpviews(){
        
        self.addSubview(scrollPreviewItemsContainerView)
        self.addSubview(priceAndDescription)
        self.addSubview(commentsContainerView)
        self.addSubview(shopContainerView)
        
        priceAndDescription.addSubview(priceLabel)
        priceAndDescription.addSubview(descriptionLabel)
        
        commentsContainerView.addSubview(commentLabel)
        MyConstraints.sharedInstance.pinConstraints(motherView: commentsContainerView, viewToPin: commentLabel, leftMargin: 8, rightMargin: -8, topMargin: 8, bottomMargin: -8)
        
        
        shopContainerView.addSubview(shopLogo)
        shopContainerView.addSubview(shopNameLabel)
        shopContainerView.addSubview(shopLevelLabel)
        shopContainerView.addSubview(shopRatingsLabel)
        
        
        
        shopRatingsLabel.leftAnchor.constraint(equalTo: shopLogo.rightAnchor, constant: 8).isActive = true
        shopRatingsLabel.rightAnchor.constraint(equalTo: shopContainerView.rightAnchor, constant: -8).isActive = true
        shopRatingsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        shopRatingsLabel.topAnchor.constraint(equalTo: shopLevelLabel.bottomAnchor, constant: 8).isActive = true
        
        shopLevelLabel.leftAnchor.constraint(equalTo: shopLogo.rightAnchor, constant: 8).isActive = true
        shopLevelLabel.rightAnchor.constraint(equalTo: shopContainerView.rightAnchor, constant: -8).isActive = true
        shopLevelLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        shopLevelLabel.topAnchor.constraint(equalTo: shopNameLabel.bottomAnchor, constant: 8).isActive = true
        
        shopNameLabel.leftAnchor.constraint(equalTo: shopLogo.rightAnchor, constant: 8).isActive = true
        shopNameLabel.rightAnchor.constraint(equalTo: shopContainerView.rightAnchor, constant: -8).isActive = true
        shopNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        shopNameLabel.topAnchor.constraint(equalTo: shopContainerView.topAnchor, constant: 8).isActive = true
        
        shopLogo.leftAnchor.constraint(equalTo: shopContainerView.leftAnchor, constant: 8).isActive = true
        shopLogo.centerYAnchor.constraint(equalTo: shopContainerView.centerYAnchor).isActive = true
        shopLogo.widthAnchor.constraint(equalToConstant: 70).isActive = true
        shopLogo.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: priceAndDescription.bottomAnchor, constant: -8).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: priceAndDescription.rightAnchor, constant: -8).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: priceAndDescription.leftAnchor, constant: 8).isActive = true
        
        
        MyConstraints.sharedInstance.pinWithHeight(motherView: priceAndDescription, viewToPin: priceLabel, leftMargin: 8, rightMargin: -8, topMargin: 15, bottomMargin: nil, height: 30, width: nil)
        
        
        
        
        shopContainerView.topAnchor.constraint(equalTo: commentsContainerView.bottomAnchor, constant: 10).isActive = true
        shopContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        shopContainerView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        shopContainerView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        
        commentsContainerView.topAnchor.constraint(equalTo: priceAndDescription.bottomAnchor, constant: 10).isActive = true
        commentsContainerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        commentsContainerView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        commentsContainerView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        priceAndDescription.topAnchor.constraint(equalTo: scrollPreviewItemsContainerView.bottomAnchor).isActive = true
        priceAndDescription.heightAnchor.constraint(equalToConstant: 160).isActive = true
        priceAndDescription.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        priceAndDescription.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        MyConstraints.sharedInstance.pinWithHeight(motherView: self, viewToPin: scrollPreviewItemsContainerView, leftMargin: 0, rightMargin: 0, topMargin: -50, bottomMargin: nil, height: 500, width: nil)
        
    }
}
