//
//  ChatsTableViewCell.swift
//  GhPay
//
//  Created by Rockson on 08/09/2017.
//  Copyright © 2017 RockzAppStudio. All rights reserved.
//

import UIKit

class ChatsTableViewCell: UITableViewCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.image = #imageLiteral(resourceName: "LogingBackgroundCityView")
        return imageView
        
    }()
    
    let itemsContainerView: UIView = {
       let cView = UIView()
        cView.translatesAutoresizingMaskIntoConstraints = false
        cView.backgroundColor = .white
        return cView
        
    }()
    
    let usernameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Samuel Rockson"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    
    let timeStampLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "2:42PM"
        label.textAlignment = .right
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    
    let lastMessageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Last message says that all the stuffs seem to be working well...."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
        
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
       super.layoutSubviews()
        
        setUpViews()
    }
    
    
    func setUpViews(){
        
       self.addSubview(profileImageView)
        self.addSubview(itemsContainerView)
        
        itemsContainerView.addSubview(timeStampLabel)
        itemsContainerView.addSubview(usernameLabel)
        itemsContainerView.addSubview(lastMessageLabel)
        
        
        lastMessageLabel.rightAnchor.constraint(equalTo: itemsContainerView.rightAnchor).isActive = true
        lastMessageLabel.leftAnchor.constraint(equalTo: itemsContainerView.leftAnchor).isActive = true
        lastMessageLabel.bottomAnchor.constraint(equalTo: itemsContainerView.bottomAnchor).isActive = true
        lastMessageLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        usernameLabel.leftAnchor.constraint(equalTo: itemsContainerView.leftAnchor).isActive = true
        usernameLabel.rightAnchor.constraint(equalTo: timeStampLabel.leftAnchor).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: itemsContainerView.topAnchor).isActive = true
        
        timeStampLabel.rightAnchor.constraint(equalTo: itemsContainerView.rightAnchor).isActive = true
        timeStampLabel.topAnchor.constraint(equalTo: itemsContainerView.topAnchor).isActive = true
        timeStampLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        timeStampLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        itemsContainerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        itemsContainerView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        itemsContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        itemsContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }

}
