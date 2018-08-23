//
//  ConfirmOrderCollectionReusableView.swift
//  ViPay
//
//  Created by Rock on 2018/8/24.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit
import MarqueeLabel

class ConfirmOrderCollectionReusableView: UICollectionReusableView {
    
    let restoAddressLabel: MarqueeLabel = {
        let label = MarqueeLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "110 street, Bantama, Kumasi. The address should be more"
        label.font = UIFont(name: FontNames.OpenSansBold, size: 18)
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    
    let nameAndPhoneTextView: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Samuel, 15650149550"
        label.font = UIFont(name: FontNames.OpenSansBold, size: 16)
        label.textColor = .white
        label.dataDetectorTypes = .all
        label.isEditable = false
        label.isSelectable = false
        label.backgroundColor = .clear
        return label
    }()
    
    let ETAContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
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
        
        self.addSubview(restoAddressLabel)
        self.addSubview(nameAndPhoneTextView)
        self.addSubview(ETAContainerView)
        
        
        ETAContainerView.topAnchor.constraint(equalTo: nameAndPhoneTextView.bottomAnchor, constant: 8).isActive = true
        ETAContainerView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        ETAContainerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        ETAContainerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        
        nameAndPhoneTextView.topAnchor.constraint(equalTo: restoAddressLabel.bottomAnchor, constant: 4).isActive = true
        nameAndPhoneTextView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameAndPhoneTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        nameAndPhoneTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        
        restoAddressLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        restoAddressLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        restoAddressLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        restoAddressLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
    }
    
}
