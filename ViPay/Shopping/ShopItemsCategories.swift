//
//  ShopItemsCategories.swift
//  ViPay
//
//  Created by Rock on 2018/8/25.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class ShopItemsCategories: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var footCategories: [FoodCategories] = {
        let one = FoodCategories(icon: #imageLiteral(resourceName: "Apparel"), title: "Apparel")
        let two = FoodCategories(icon: #imageLiteral(resourceName: "Auto"), title: "Auto")
        let three = FoodCategories(icon: #imageLiteral(resourceName: "Electronics"), title: "Electronics")
        let four = FoodCategories(icon: #imageLiteral(resourceName: "Gifts"), title: "Gifts")
        let five = FoodCategories(icon: #imageLiteral(resourceName: "Home"), title: "Home")
        let six = FoodCategories(icon: #imageLiteral(resourceName: "Beauty"), title: "Beauty")
        let seven = FoodCategories(icon: #imageLiteral(resourceName: "Agriculture"), title: "Agriculture")
        let eight = FoodCategories(icon: #imageLiteral(resourceName: "Office"), title: "Office")
        return [one,two,three,four,five,six,seven,eight]
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = UIColor.groupTableViewBackground
        return cv
    }()
    
    var motherVC: FoodViewController?
    private let identifier = "identifier"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(FoodCategoryViewCell.self, forCellWithReuseIdentifier: identifier)
        
        setUpViews()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        self.addSubview(collectionView)
        
        MyConstraints.sharedInstance.pinConstraints(motherView: self, viewToPin: collectionView, leftMargin: 0, rightMargin: 0, topMargin: 0, bottomMargin: 0)
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.footCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FoodCategoryViewCell
        cell.backgroundColor = .white
        let item = self.footCategories[indexPath.item]
        
        cell.titleLabel.text = item.title
        cell.iconImageView.image = item.icon
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 4, height: self.frame.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let catDetailsVC = FoodCategoryDeailtViewController()
        catDetailsVC.hidesBottomBarWhenPushed = true
        self.motherVC?.navigationController?.pushViewController(catDetailsVC, animated: true)
        
    }

}
