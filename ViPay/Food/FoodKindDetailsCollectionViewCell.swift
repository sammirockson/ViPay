//
//  FoodKindDetailsCollectionViewCell.swift
//  GhPay
//
//  Created by Rockson on 12/09/2017.
//  Copyright © 2017 RockzAppStudio. All rights reserved.
//

import UIKit

class FoodKindDetailsCollectionViewCell: UICollectionViewCell {
    
    var object: Food?
    
    let itemDisplayImage: UIImageView = {
        let imv = UIImageView()
        imv.translatesAutoresizingMaskIntoConstraints = false
        imv.contentMode = .scaleAspectFill
        imv.clipsToBounds = true
        imv.image = #imageLiteral(resourceName: "McDon")
        //        imv.layer.cornerRadius = 5
        return imv
        
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Fast Food"
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 14)
        label.numberOfLines = 1
        return label
        
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Ghc 5.00"
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 12)
        label.numberOfLines = 1
        label.textColor = .red
        return label
        
    }()
    
    
    let quantityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "0"
        label.font = UIFont(name: FontNames.OpenSansBold, size: 12)
        label.numberOfLines = 1
        label.textColor = .black
        label.isHidden = true
        //        label.backgroundColor = .blue
        return label
        
    }()
    
    
    
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 13
        button.clipsToBounds = true
        button.setTitle("+", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: FontNames.OpenSansBold, size: 22)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        return button
        
    }()
    
    
    let deleteOrderButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 13
        button.clipsToBounds = true
        button.setTitle("-", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: FontNames.OpenSansBold, size: 22)
        button.setTitleColor(.blue, for: .normal)
        button.isHidden = true
        //        button.backgroundColor = .blue
        return button
        
    }()
    
    var incomingVC: FoodKindDetailsCollectionViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        
        //        self.addButton.addTarget(self, action: #selector(handleAddOrder), for: .touchUpInside)
        //        self.deleteOrderButton.addTarget(self, action: #selector(handleModifyOrder), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func setUpViews(){
        
        self.addSubview(itemDisplayImage)
        self.addSubview(titleLabel)
        self.addSubview(priceLabel)
        self.addSubview(quantityLabel)
        self.addSubview(addButton)
        self.addSubview(deleteOrderButton)
        
        
        
        deleteOrderButton.rightAnchor.constraint(equalTo: quantityLabel.leftAnchor, constant: 0).isActive = true
        deleteOrderButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
        deleteOrderButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        deleteOrderButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        quantityLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        quantityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        quantityLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        quantityLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -15).isActive = true
        
        
        
        priceLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        
        
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: itemDisplayImage.bottomAnchor, constant: 5).isActive = true
        
        
        addButton.leftAnchor.constraint(equalTo: quantityLabel.rightAnchor, constant: 0).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        addButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        itemDisplayImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        itemDisplayImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        itemDisplayImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        itemDisplayImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
}
