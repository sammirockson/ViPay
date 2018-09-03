//
//  ShoppingCollectionViewCell.swift
//  GhPay
//
//  Created by Rockson on 12/09/2017.
//  Copyright © 2017 RockzAppStudio. All rights reserved.
//

import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {
    
    let thumbnailImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "love")
        return imageView
    }()
    
    let containerView: UIView = {
       let cView = UIView()
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.backgroundColor = .white
        cView.layer.cornerRadius = 8
        cView.layer.shadowColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 1.0).cgColor
        cView.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        cView.layer.shadowRadius = 1.7
        cView.layer.shadowOpacity = 0.35
        return cView
        
    }()
    
    
    let priceLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ghc2,000.00"
        label.textColor = defaultAppColor
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 14)
        return label
    }()
 
    let itemDescription: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Product description to. Seller can write anything here.At most three lines or it'll be truncated."
        label.font = UIFont(name: FontNames.OpenSansRegular, size: 14)
        label.isEditable = false
        label.isScrollEnabled = false
        label.isSelectable = false
        return label
    }()
    
    
    let numberOfPeopleWhoPurchasedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1.2k orders"
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 10)
        label.numberOfLines = 1
        label.textAlignment = .right
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
        
        self.addSubview(containerView)
        containerView.addSubview(thumbnailImageView)
        containerView.addSubview(priceLabel)
        containerView.addSubview(itemDescription)
        containerView.addSubview(numberOfPeopleWhoPurchasedLabel)
        
        numberOfPeopleWhoPurchasedLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -8).isActive = true
        numberOfPeopleWhoPurchasedLabel.leftAnchor.constraint(equalTo: priceLabel.rightAnchor).isActive = true
        numberOfPeopleWhoPurchasedLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        numberOfPeopleWhoPurchasedLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -2).isActive = true
        
        
        itemDescription.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: 4).isActive = true
        itemDescription.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 4).isActive = true
        itemDescription.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -2).isActive = true
        itemDescription.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 2).isActive = true
        
        priceLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant:  100).isActive = true
        
        thumbnailImageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        thumbnailImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        thumbnailImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: 210).isActive = true
       
        
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 1).isActive = true
        containerView.topAnchor.constraint(equalTo: self.topAnchor,constant: 1).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        
     
        
    }
    
}
