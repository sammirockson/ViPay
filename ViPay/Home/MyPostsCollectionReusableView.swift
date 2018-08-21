//
//  MyPostsCollectionReusableView.swift
//  ViPay
//
//  Created by Rock on 2018/8/4.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class MyPostsCollectionReusableView: UICollectionReusableView {
    
    let backgroundImageView: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "binbing")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    
    let backgroundBlurView: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "darkTransparentView")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
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
        
        self.addSubview(backgroundImageView)
        self.addSubview(backgroundBlurView)
        
        
        backgroundBlurView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        backgroundBlurView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backgroundBlurView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        backgroundBlurView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        backgroundImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
}
