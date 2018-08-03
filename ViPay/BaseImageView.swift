//
//  BaseImageView.swift
//  ViPay
//
//  Created by Rock on 2018/7/31.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class BaseImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
