//
//  IndicatorCellCollectionViewCell.swift
//  cryptowallet
//
//  Created by Rock on 2018/7/9.
//  Copyright © 2018 Cybermiles. All rights reserved.
//

import UIKit

class IndicatorCellCollectionViewCell: UICollectionViewCell {
    
    let indicatorView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 6
        v.clipsToBounds = true 
        return v
    }()
    
    let indicatorBlueColorView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = defaultAppColor
        v.layer.cornerRadius = 4
        v.clipsToBounds = true
        v.isHidden = true 
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(indicatorView)
        self.addSubview(indicatorBlueColorView)
        
        indicatorBlueColorView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        indicatorBlueColorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicatorBlueColorView.widthAnchor.constraint(equalToConstant: 8).isActive = true
        indicatorBlueColorView.heightAnchor.constraint(equalToConstant: 8).isActive = true
        
        indicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        indicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicatorView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        indicatorView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
