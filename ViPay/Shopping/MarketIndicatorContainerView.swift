//
//  MarketIndicatorContainerView.swift
//  cryptowallet
//
//  Created by Rock on 2018/7/9.
//  Copyright © 2018 Cybermiles. All rights reserved.
//

import UIKit

class MarketIndicatorContainerView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
//        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        cv.isScrollEnabled = false
        return cv
    }()
    

   private let identifier = "identifier"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(IndicatorCellCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        
        self.addSubview(collectionView)
     
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! IndicatorCellCollectionViewCell
        cell.backgroundColor = .clear
        if indexPath.item == 0 {
            cell.indicatorBlueColorView.isHidden = false
        }else{
            cell.indicatorBlueColorView.isHidden = true 

        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 4, height: self.frame.height)
    }
    
    
}
