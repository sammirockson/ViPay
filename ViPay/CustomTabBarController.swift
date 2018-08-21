//
//  CustomTabBarController.swift
//  GhPay
//
//  Created by Rockson on 07/09/2017.
//  Copyright © 2017 RockzAppStudio. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let homeLayout = UICollectionViewFlowLayout()
//        homeLayout.minimumLineSpacing = 2
//        homeLayout.minimumInteritemSpacing = 0
        let homeVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem.title = "Home"
        homeVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "HomeSelected")
        homeVC.tabBarItem.image = #imageLiteral(resourceName: "HomeUnselected")
        homeVC.tabBarItem.tag = 1
        
        
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
        
        let shoppingVC = ShoppingViewController()
        let shoppingNav = UINavigationController(rootViewController: shoppingVC)
        shoppingVC.tabBarItem.title = "Shop"
        shoppingVC.tabBarItem.image = #imageLiteral(resourceName: "shopUnselected")
        shoppingVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "shopSelected")



        let chatVC = ChatsTableViewController()
        let chatNav = UINavigationController(rootViewController: chatVC)
        chatVC.tabBarItem.title = "Chats"
        chatVC.tabBarItem.image = #imageLiteral(resourceName: "ChatsUnaelecteed")
        chatVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "ChatsSelected")
        chatVC.tabBarItem.tag = 2


//        let cartLayout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
        
        let cartVC = FoodViewController()
        let cartNav = UINavigationController(rootViewController: cartVC)
        cartVC.tabBarItem.title = "Food"
        cartVC.tabBarItem.image = #imageLiteral(resourceName: "cartUnselected")
        cartVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "cartSelected")


        let moreVC = MoreItemsTableViewController()
        let moreNav = UINavigationController(rootViewController: moreVC)
        moreVC.tabBarItem.title = "Me"
        moreVC.tabBarItem.image = #imageLiteral(resourceName: "MeIcon")
        moreVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "MeSelectedIcon")
        moreVC.tabBarItem.tag = 5
        
        
        viewControllers = [homeNav,chatNav,shoppingNav,cartNav,moreNav]
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   
        
       navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
        
    }

  
}
