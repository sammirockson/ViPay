//
//  ShoppingHeaderCollectionReusableView.swift
//  ViPay
//
//  Created by Rock on 2018/8/13.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class ShoppingHeaderCollectionReusableView: UICollectionReusableView  {
    
    lazy var topContainerView: MarketingPreviewContainerView = {
        let button = MarketingPreviewContainerView()
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews(){
        
        self.addSubview(topContainerView)
     
        topContainerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        topContainerView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        topContainerView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    }
}
