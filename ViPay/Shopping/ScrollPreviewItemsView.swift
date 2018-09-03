//
//  ScrollPreviewItemsView.swift
//  ViPay
//
//  Created by Rock on 2018/8/25.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class ScrollPreviewItemsView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = UIColor(white: 0.9, alpha: 0.9)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isPagingEnabled = true
        return cv
    }()
    
    private let identifier = "identfier"

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(ScrollPreviewItemsCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        
        self.addSubview(collectionView)
        
        MyConstraints.sharedInstance.pinConstraints(motherView: self, viewToPin: collectionView, leftMargin: 0, rightMargin: 0, topMargin: 0, bottomMargin: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ScrollPreviewItemsCollectionViewCell
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height)
    }
    
}
