//
//  HomeCollectionViewCell.swift
//  ViPay
//
//  Created by Rock on 2018/8/3.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    let thinTopLine: BaseUIView = {
        let v = BaseUIView()
        v.backgroundColor = RGB.sharedInstance.requiredColor(r: 51, g: 34, b: 211, alpha: 1.0)
        v.alpha = 0.2
        return v
    }()
    
    let thinBottomLine: BaseUIView = {
        let v = BaseUIView()
        v.backgroundColor = RGB.sharedInstance.requiredColor(r: 51, g: 34, b: 211, alpha: 1.0)
        v.alpha = 0.2
        return v
    }()
    
    
    let thinBottomDividerLine: BaseUIView = {
        let v = BaseUIView()
        v.backgroundColor = RGB.sharedInstance.requiredColor(r: 51, g: 34, b: 211, alpha: 1.0)
        v.alpha = 0.2
//            UIColor(white: 0.8, alpha: 0.5)
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
        
        self.addSubview(thinTopLine)
        self.addSubview(thinBottomLine)
        self.addSubview(thinBottomDividerLine)
        
        thinBottomDividerLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 120).isActive = true
        thinBottomDividerLine.heightAnchor.constraint(equalToConstant: 50).isActive = true
        thinBottomDividerLine.topAnchor.constraint(equalTo: thinBottomLine.bottomAnchor).isActive = true
        thinBottomDividerLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        thinBottomLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        thinBottomLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        thinBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        thinBottomLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true
        
        thinTopLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        thinTopLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        thinTopLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        thinTopLine.topAnchor.constraint(equalTo: self.topAnchor, constant: 75).isActive = true
        
    }
    
}
