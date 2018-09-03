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
    
    
    
    lazy var shopItemsCategories: ShopItemsCategories = {
        let button = ShopItemsCategories()
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var shopAdvertContainerView: ShopAdvertContainerView = {
        let button = ShopAdvertContainerView()
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        
//        let a = FoodCategoriesContainerView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews(){
        
        self.addSubview(topContainerView)
        self.addSubview(shopItemsCategories)
        self.addSubview(shopAdvertContainerView)
        
        shopAdvertContainerView.topAnchor.constraint(equalTo: shopItemsCategories.bottomAnchor, constant: 10).isActive = true
        shopAdvertContainerView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        shopAdvertContainerView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        shopAdvertContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        
        MyConstraints.sharedInstance.pinWithHeight(motherView: self, viewToPin: topContainerView, leftMargin: 0, rightMargin: 0, topMargin: 0, bottomMargin: nil, height: 240, width: nil)
     
        shopItemsCategories.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        shopItemsCategories.heightAnchor.constraint(equalToConstant: 200).isActive = true
        shopItemsCategories.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        shopItemsCategories.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    }
}
