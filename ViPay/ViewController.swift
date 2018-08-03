//
//  ViewController.swift
//  ViPay
//
//  Created by Rock on 2018/7/30.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = RGB.sharedInstance.requiredColor(r: 51, g: 229, b: 211, alpha: 1.0)
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

