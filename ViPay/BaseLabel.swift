//
//  BaseLabel.swift
//  ViPay
//
//  Created by Rock on 2018/8/1.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class BaseLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
