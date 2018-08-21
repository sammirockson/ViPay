//
//  ChatsTableViewController.swift
//  GhPay
//
//  Created by Rockson on 08/09/2017.
//  Copyright © 2017 RockzAppStudio. All rights reserved.
//

import UIKit
//import Parse

class ChatsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    var users = [AnyObject]()
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
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
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    
    
    let navBarTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 16)
        label.text = "Chats"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var  searchController:  UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        return  controller
        
    }()
    
    let identifierString = "identifierString"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddFriends))
        navigationItem.setRightBarButtonItems([rightBarButtonItem], animated: true)
        

//        navigationController?.navigationBar.barTintColor = LoginViewController.defaultColor
//        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Chats"
        
       tableView.register(ChatsTableViewCell.self, forCellReuseIdentifier: identifierString)
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = true
        self.tableView.tableHeaderView = self.searchController.searchBar
        definesPresentationContext = true
//        self.searchController.searchBar.delegate = self
        
        tableView.tableHeaderView = searchController.searchBar
        self.setUpViews()
        view.backgroundColor = .white
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
    
    
    func queryRoom(){
        
//        let user1 = PFUser.current()
//        let user2 = PFUser.current()
//
//        let pred = NSPredicate(format: "user1 = %@ AND user2 = %@ OR user1 = %@ AND user2 = %@", user1!,user2!,user2!,user1!)
//        let query = PFQuery(className: "Room",predicate: pred)
//        query.includeKey("user1,user2")
//        query.cachePolicy = .cacheThenNetwork
//        query.findObjectsInBackground { (rooms, error) in
//            if error == nil {
//
//                if rooms!.count > 0 {
//
//                    self.users.removeAll(keepingCapacity: true)
//
//                    for room in rooms! {
//
//                        if let user1 = room.object(forKey: "user1") as? PFUser {
//
//                            self.users.append(user1)
//
//                        }
//                        if let user2 = room.object(forKey: "user2") as? PFUser {
//
//                            self.users.append(user2)
//
//                        }
//
//
//                    }
//
//                    DispatchQueue.main.async {
//
//                        self.tableView.reloadData()
//                    }
//                }
//
//            }else{
//
//                print(error?.localizedDescription as Any)
//            }
//        }
    }

    
    @objc func handleAddFriends(){
        
        let actionSheet = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "My QRCode", style: .default, handler: { (action) in
            
//            let myQrCode = AddMeQRCodeViewController()
//            myQrCode.hidesBottomBarWhenPushed = true
//            myQrCode.navTitleLabel.text = "Scan to add a friend"
//            self.navigationController?.pushViewController(myQrCode, animated: true)
        }))
        actionSheet.addAction(UIAlertAction(title: "Scan to add user", style: .default, handler: { (action) in
            
//            let myQrCode = ScanToAddAFriendViewController()
//            myQrCode.hidesBottomBarWhenPushed = true
////            myQrCode.navTitleLabel.text = "Scan to add a friend"
//            self.navigationController?.pushViewController(myQrCode, animated: true)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        queryRoom()
        
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.isNavigationBarHidden = true

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 100
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierString, for: indexPath) as! ChatsTableViewCell
        
//        let user = self.users[indexPath.row]
//
//        cell.usernameLabel.text = user.username
//
//        if let profileImageFile = user.object(forKey: "profileImageFile") as? PFFile {
//
//            let url = URL(string: profileImageFile.url!)
//            cell.profileImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "personplaceholder"), options: .refreshCached, completed: nil)
//        }

        return cell
    }
 
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let messagesVC = ChatLogsCollectionViewController(collectionViewLayout: layout)
        messagesVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(messagesVC, animated: true)

    }
 

}
