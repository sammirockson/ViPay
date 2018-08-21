//
//  MoreItemsTableViewCell.swift
//  BudiChat
//
//  Created by Rockson on 21/05/2017.
//  Copyright © 2017 RockzAppStudio. All rights reserved.
//

import UIKit

class MoreItemsTableViewCell: UITableViewCell {
    
    let itemsNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 16)
        return label
        
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selecled: Bool, animated: Bool) {
        super.setSelected(isSelected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setUpViews()
    }
    
    func setUpViews(){
        
        self.addSubview(itemsNameLabel)
        
        itemsNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        itemsNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18).isActive = true
        itemsNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        itemsNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }

}
