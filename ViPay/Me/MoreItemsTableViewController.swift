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

class MoreItemsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var headerView: ProfileHeaderView = {
       let h = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        h.backgroundColor = UIColor.groupTableViewBackground
        return h
    }()
    
    let customNavContainerView: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "Background")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.isUserInteractionEnabled = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var tableView: UITableView = {
        let tb = UITableView(frame: .zero, style: UITableViewStyle.grouped)
        tb.delegate = self
        tb.dataSource = self
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    
    

    
    let cellId = "cellId"
   
    
    lazy var itemNamesArray: [[itemNames]] = {
        let itemOne = itemNames(itemName: "Wallet")
        let myShop = itemNames(itemName: "My shop")
        let itemTwo = itemNames(itemName: "Services")
        let itemThree = itemNames(itemName: "My orders")
        let itemFour = itemNames(itemName: "General")
        let itemFive = itemNames(itemName: "Privacy")
        let itemSix = itemNames(itemName: "About Us")
        let itemSeven = itemNames(itemName: "Ratings")
        let itemAccount = itemNames(itemName: "Account")
        return [[itemOne,myShop], [itemThree],[itemFour,itemFive,itemSix], [itemSeven,itemAccount]]
        
    }()
    
    
    let navBarTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 16)
        label.text = "Me"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpViews()

        tableView.tableHeaderView = headerView
        tableView.register(MoreItemsTableViewCell.self, forCellReuseIdentifier: cellId)


        let attributedMutableText = NSMutableAttributedString(string: "Samuel Rockson", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 17)])
        
        
        let atrributedText = NSAttributedString(string: "\n ViPay ID, Display Name and Profile Picture", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        attributedMutableText.append(atrributedText)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        attributedMutableText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedMutableText.string.count))
        
        headerView.usernameLabel.attributedText = attributedMutableText
        
//        if let profileImageFile = currentUser.object(forKey: "profileImageFile") as? PFFile {
//
//            let url = URL(string: profileImageFile.url!)
//            headerView.profileImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "personplaceholder"), progress: nil, completed: nil)
//
//        }

        
    
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
        
    }
    
    func setUpViews(){
        
        view.addSubview(customNavContainerView)
        customNavContainerView.addSubview(navBarTitleLabel)
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: customNavContainerView.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        if UIDevice.current.isIphoneX {
            
            navBarTitleLabel.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 15).isActive = true
            
            
        }else{
            
            navBarTitleLabel.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 10).isActive = true
            
        }
        navBarTitleLabel.rightAnchor.constraint(equalTo: customNavContainerView.rightAnchor, constant: -32).isActive = true
        navBarTitleLabel.leftAnchor.constraint(equalTo: customNavContainerView.leftAnchor, constant: 32).isActive = true
        navBarTitleLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        customNavContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        customNavContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        customNavContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        if UIDevice.current.isIphoneX {
            
            customNavContainerView.heightAnchor.constraint(equalToConstant: 90).isActive = true
            
            
        }else{
            
            customNavContainerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
        }
        
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
    
//        if let currentUser = PFUser.current() {
//
//        }
        
       
        
        
//    }
    
    

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            
            return self.itemNamesArray[0].count
            
        }else if section == 1 {
            
            return self.itemNamesArray[1].count
            
        }else if section == 2 {
            
            return self.itemNamesArray[2].count
            
        }else{
            
            
            return self.itemNamesArray[3].count
        }
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MoreItemsTableViewCell
        cell.accessoryType = .disclosureIndicator
        
        let sectionItems = itemNamesArray[indexPath.section][indexPath.row]
        cell.itemsNameLabel.text = sectionItems.itemName
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
