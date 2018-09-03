//
//  ShopAdvertContainerView.swift
//  ViPay
//
//  Created by Rock on 2018/8/25.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class ShopAdvertContainerView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    var motherVC: FoodViewController?
    private let identifier = "identifier"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        collectionView.register(RandomizedCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        
        
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
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! RandomizedCollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.thumbnailImageView.image = #imageLiteral(resourceName: "Background")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width:  frame.width / 2, height: self.frame.height / 3)
        return size
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }

}
