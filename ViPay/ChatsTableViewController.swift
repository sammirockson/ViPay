//
//  ChatsTableViewController.swift
//  GhPay
//
//  Created by Rockson on 08/09/2017.
//  Copyright © 2017 RockzAppStudio. All rights reserved.
//

import UIKit
//import Parse

class ChatsTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var users = [AnyObject]()
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
    
    let navBarTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Chats"
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
        
        self.loadUsers()
        navigationItem.titleView = navBarTitleLabel

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
    }
    
    

    
    
    func loadUsers(){
        
//       let query = BmobUser.query()
//        query?.cachePolicy = kBmobCachePolicyCacheThenNetwork
//        query?.findObjectsInBackground({ (results, error) in
//            if error == nil {
//                self.users.removeAll(keepingCapacity: true)
//
//                if results!.count > 0 {
//
//                    for result in results! {
//
//                     self.users.append(result as! BmobUser)
//
//                    }
//
//                    DispatchQueue.main.async {
//
//                        self.tableView.reloadData()
//                    }
//
//                }
//
//
//            }else{
//
//
//            }
//        })
        
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
        
//        self.navigationController?.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "GhPayColor"), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.barTintColor = LoginViewController.defaultColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0
//        let messagesVC = ChatLogsCollectionViewController(collectionViewLayout: layout)
//        messagesVC.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(messagesVC, animated: true)

    }
 

}
