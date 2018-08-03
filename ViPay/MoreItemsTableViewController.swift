//
//  MoreItemsTableViewController.swift
//  BudiChat
//
//  Created by Rockson on 21/05/2017.
//  Copyright © 2017 RockzAppStudio. All rights reserved.
//

import UIKit
//import Parse
import SVProgressHUD

struct itemNames {
    var itemName: String
}

class MoreItemsTableViewController: UITableViewController {
    
    lazy var headerView: ProfileHeaderView = {
       let h = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        h.backgroundColor = UIColor.groupTableViewBackground
        return h
        
    }()
    
    let cellId = "cellId"
   
    
    lazy var itemNamesArray: [[itemNames]] = {
        let itemOne = itemNames(itemName: "Wallet")
        let itemTwo = itemNames(itemName: "Services")
        let itemThree = itemNames(itemName: "My orders")
        let itemFour = itemNames(itemName: "General")
        let itemFive = itemNames(itemName: "Privacy")
        let itemSix = itemNames(itemName: "About Us")
        let itemSeven = itemNames(itemName: "Log out")
        return [[itemOne], [itemThree],[itemFour,itemFive,itemSix], [itemSeven]]
        
    }()
    
    
    let navBarTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Colors.veryDarkBlue
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 18)
        label.text = "Me"
        return label
    }()
    
    
    lazy var blurView: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        v.alpha = 0
        v.backgroundColor = UIColor(white: 0.1, alpha: 0.8)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView = headerView
        navigationItem.titleView = navBarTitleLabel
        tableView.register(MoreItemsTableViewCell.self, forCellReuseIdentifier: cellId)
        
     
        
//        navigationController?.navigationBar.barTintColor = LoginViewController.defaultColor
//        navigationController?.navigationBar.tintColor = .white


        view.addSubview(blurView)
    
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        if let currentUser = PFUser.current() {
//
//            let attributedMutableText = NSMutableAttributedString(string: currentUser.username!, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 17)])
//
//
//            let atrributedText = NSAttributedString(string: "\n GhPay ID, Display Name and Profile Picture", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.lightGray])
//            attributedMutableText.append(atrributedText)
//
//            let paragraphStyle = NSMutableParagraphStyle()
//            paragraphStyle.lineSpacing = 4
//
//            attributedMutableText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedMutableText.string.count))
//
//            headerView.usernameLabel.attributedText = attributedMutableText
//
//            if let profileImageFile = currentUser.object(forKey: "profileImageFile") as? PFFile {
//
//                let url = URL(string: profileImageFile.url!)
//                headerView.profileImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "personplaceholder"), progress: nil, completed: nil)
//
//            }
//        }
        
       
        
        
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            
            return 1
            
        }else if section == 1 {
            
            return 1
            
        }else if section == 2 {
            
            return 3
            
        }else{
            
            
            
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MoreItemsTableViewCell
        cell.accessoryType = .disclosureIndicator
        
        let sectionItems = itemNamesArray[indexPath.section][indexPath.row]
        cell.itemsNameLabel.text = sectionItems.itemName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let sectionItems = itemNamesArray[indexPath.section][indexPath.row]
        
        print(sectionItems.itemName)
//        
//        if sectionItems.itemName == "Merchant" {
//            
//            let merchantTabVC = MerchantTabBarViewController()
//            merchantTabVC.hidesBottomBarWhenPushed = true 
//            navigationController?.pushViewController(merchantTabVC, animated: true)
//            
//        }
        
        if sectionItems.itemName == "My orders" {
            
//            let layout = UICollectionViewFlowLayout()
//            let myOrdersVC = MyOrdersCollectionViewController(collectionViewLayout: layout)
//            myOrdersVC.hidesBottomBarWhenPushed = true
//            navigationController?.pushViewController(myOrdersVC, animated: true)
            
        }
        
        
        if sectionItems.itemName == "Wallet" {
            
//            let walletVC = WalletViewController()
//            walletVC.hidesBottomBarWhenPushed = true
//            navigationController?.pushViewController(walletVC, animated: true)
            
//            let layout = UICollectionViewFlowLayout()
//            layout.minimumLineSpacing = 1
//            layout.minimumInteritemSpacing = 1
//            let walletVC = WalletCollectionViewController(collectionViewLayout: layout)
//            walletVC.hidesBottomBarWhenPushed = true
//            navigationController?.pushViewController(walletVC, animated: true)
            
        }
    
//        let itemSeven = itemNames(itemName: "Log out")

//        if sectionItems.itemName == "Log out" {
//
//            self.blurView.alpha = 1
//            SVProgressHUD.show(withStatus: "Logging out...")
//
//            PFUser.logOutInBackground(block: { (error) in
//                if error == nil {
//
//                    self.blurView.alpha = 0
//                    SVProgressHUD.dismiss()
//
//                    DispatchQueue.main.async {
//
//                        let loginVC = LoginViewController()
//                        loginVC.hidesBottomBarWhenPushed = true
//                        self.navigationController?.pushViewController(loginVC, animated: true)
//
//                    }
//
//                }else{
//
//                    //error loging out
//
//                    self.blurView.alpha = 0
//
//                }
//            })
//
//
//
//        }
        
    }

   

}
