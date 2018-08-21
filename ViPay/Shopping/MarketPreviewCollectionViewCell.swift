//
//  MarketPreviewCollectionViewCell.swift
//  cryptowallet
//
//  Created by Rock on 2018/7/9.
//  Copyright © 2018 Cybermiles. All rights reserved.
//

import UIKit

class MarketPreviewCollectionViewCell: UICollectionViewCell {
    
    let icon: UIImageView = {
        let imageV = UIImageView()
        imageV.image = #imageLiteral(resourceName: "shanghai")
        imageV.contentMode = .scaleAspectFill
        imageV.clipsToBounds = true
        imageV.translatesAutoresizingMaskIntoConstraints = false
        return imageV
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 18)
        label.textAlignment = .center
        label.textColor = .white
        label.text = ""
        label.numberOfLines = 0
        label.isHidden = true
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
        
        self.addSubview(icon)
        self.addSubview(title)
        
        title.widthAnchor.constraint(equalToConstant: 280).isActive = true
        title.heightAnchor.constraint(equalToConstant: 55).isActive = true
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        title.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 10).isActive = true
        
        icon.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        icon.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        icon.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        icon.leftAnchor.constraint(equalTo: self.leftAnchor).isActive  = true
        
    }
    
}
