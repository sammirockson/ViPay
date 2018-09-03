//
//  FoodCollectionReusableView.swift
//  ViPay
//
//  Created by Rock on 2018/8/19.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class FoodCollectionReusableView: UICollectionReusableView {
    
    let foodCategoryContainerView: FoodCategoriesContainerView = {
        let v = FoodCategoriesContainerView(frame: .zero)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    
    let advertContainerView: RandomizedContainerView = {
        let v = RandomizedContainerView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
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
        
        self.addSubview(foodCategoryContainerView)
        self.addSubview(advertContainerView)
        
        advertContainerView.topAnchor.constraint(equalTo: foodCategoryContainerView.bottomAnchor, constant: 20).isActive = true
        advertContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40).isActive = true
        advertContainerView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        advertContainerView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        MyConstraints.sharedInstance.pinWithHeight(motherView: self, viewToPin: foodCategoryContainerView, leftMargin: 0, rightMargin: 0, topMargin: 0, bottomMargin: nil, height: 200, width: nil)
        
       
    }
    
}
