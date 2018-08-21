//
//  FoodKindDetailsCollectionViewController.swift
//  GhPay
//
//  Created by Rockson on 12/09/2017.
//  Copyright © 2017 RockzAppStudio. All rights reserved.
//

import UIKit
import CoreData


class FoodKindDetailsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var quantityOfFoodOrderedArray = [Food]()
    var totalPrice: Int = 0
    
    
    
    let moc: NSManagedObjectContext = {
        let objectContext: NSManagedObjectContext?
        let appDel = UIApplication.shared.delegate as! AppDelegate
        objectContext = appDel.persistentContainer.viewContext
        return objectContext!
        
    }()
    
    private let reuseIdentifier = "Cell"
    
    var foodArray = [Food]()
    
    
    lazy var shoppingCartLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //        button.layer.cornerRadius = 30
        label.clipsToBounds = true
        label.backgroundColor = defaultAppColor
        label.text = "Next"
        label.textColor = .white
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        label.isEnabled = false
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handlePayOrder)))
        return label
        
    }()
    
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.text = "0"
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 14)
        label.textColor = .white
        label.numberOfLines = 0
        return label
        
    }()
    
    
    let cartImageView: UIImageView = {
        let imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.image = #imageLiteral(resourceName: "shoppingCart")
        return imageV
        
    }()
    
    
    let totalQuantityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = ""
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 12)
        label.numberOfLines = 1
        label.textColor = .white
        label.isHidden = true
        label.backgroundColor = .red
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        return label
        
    }()
    
    
    let cartContainerView: UIView = {
        let cartView = UIView()
        cartView.translatesAutoresizingMaskIntoConstraints = false
        cartView.backgroundColor = .lightGray
        return cartView
        
    }()
    
    var selectedTitle = ""
    
    let navTitle: UILabel = {
        let label = UILabel()
        label.text = "Place your order"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 16)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpViews()
        totalPrice = 0
        
        navigationItem.titleView = navTitle
        collectionView?.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        
        let leftArrowIcon = #imageLiteral(resourceName: "Arrow Left")
        let leftBackButton = UIBarButtonItem(image: leftArrowIcon, style: .done, target: self, action: #selector(handleBackButton))
        navigationItem.setLeftBarButton(leftBackButton, animated: true)

        
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 60, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 60, 0)
        
       
        
        // Register cell classes
        self.collectionView!.register(FoodKindDetailsCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.updatePriceLabel()
        
        self.quantityOfFoodOrderedArray.removeAll(keepingCapacity: true)
        
        //        self.queryOrderFromCoreData()
        
        self.refreshOrders()
        
        self.queryFoodItems()
        
        
    }
    
    
    @objc func handleBackButton(){
        
      navigationController?.popViewController(animated: true)
        
        
    }
    
    func queryFoodItems(){
        
        //        let object = BmobObject(className: "Items")
        //        object?.setObject(BmobUser.current().objectId, forKey: "sellerId")
        //        object?.setObject(imageFile, forKey: "item")
        //        object?.setObject(textDescription, forKey: "description")
        //        object?.setObject(foodType, forKey: "foodCategory")
        //        object?.setObject(price, forKey: "price")
        //        object?.setObject(name, forKey: "nameOfFood")
        //        object?.setObject(true, forKey: "inStock")
        
//        let query = BmobQuery(className: "Items")
//        //        query?.order(byDescending: "createdAt")
//        query?.whereKey("foodCategory", equalTo: selectedTitle)
//        query?.findObjectsInBackground({ (results, error) in
//            if error == nil {
//
//                print(results?.count)
//
//
//                if (results?.count)! > 0 {
//
//                    self.foodArray.removeAll(keepingCapacity: true)
//
//                    for result in results! {
//
//                        let foodItem = Food()
//                        //                        item8.buyer?.username = "Rockson"
//                        //                        item8.city = "Kumasi"
//                        //                        item8.foodTitle = "Fante kenkey"
//                        //                        item8.price = 10
//                        //                        item8.createdAt = Date()
//                        //                        item8.objectId = "110033123456789"
//
//
//                        if let foodObject = result as? BmobObject {
//
//                            if let price = foodObject.object(forKey: "price") as? Int {
//
//
//                                foodItem.price = price
//                            }
//
//                            if let name = foodObject.object(forKey: "nameOfFood") as? String {
//
//                                foodItem.foodTitle = name
//
//                            }
//
//                            if let description = foodObject.object(forKey: "description") as? String {
//
//                                foodItem.orderDescription = description
//
//                            }
//
//                            if let thumbnailImage = foodObject.object(forKey: "item") as? BmobFile {
//
//                                foodItem.thumbnailImageURL = thumbnailImage.url
//                            }
//
//                            if let sellerId = foodObject.object(forKey: "sellerId") as? String {
//
//                                foodItem.seller?.objectId = sellerId
//
//                            }
//
//
//                            foodItem.objectId = foodObject.objectId
//                            foodItem.createdAt = foodObject.createdAt
//
//                            self.foodArray.append(foodItem)
//
//                            DispatchQueue.main.async {
//
//                                self.collectionView?.reloadData()
//                            }
//
//
//                        }
//
//
//                    }
//
//                }
//
//
//            }else{
//
//                print(error?.localizedDescription)
//            }
//        })
//
        
        
    }
   
    
    //Query from coreData
    
    func queryOrderFromCoreData(){
        
        let request: NSFetchRequest<Order> = Order.fetchRequest()
        //        request.predicate = NSPredicate(format: "objectId == %@", friend.objectId)
        
        do {
            let searchResults = try moc.fetch(request)
            
            print(searchResults.count)
            
            if searchResults.count > 0  {
                
                // save the new user if the user doesn't exis
                
                
            }else{
                
                
            }
            
        } catch {
            //            loadingObjectsView.isHidden = true
            print("Error with request: \(error)")
            
            
        }
        
        
    }
    
    
    func queryandUpdateCoreData(order: Food, cell: FoodKindDetailsCollectionViewCell){
        let queryTotalOrders: NSFetchRequest<TotalPrice> = TotalPrice.fetchRequest()
        
        do {
            
            let foundResults = try self.moc.fetch(queryTotalOrders)
            
            if foundResults.count > 0 {
                
                
                if var price = foundResults.last?.totalPrice {
                    
                    if Int(price) > order.price! {
                        
                        price = Int32(Int(price) - order.price!)
                        
                        
                        //                        let entity1 = NSEntityDescription.insertNewObject(forEntityName: "TotalPrice", into: moc) as! TotalPrice
                        //                        entity1.totalPrice = price
                        
                        foundResults.last?.totalPrice = price
                        
                        do {
                            
                            try self.moc.save()
                            
                        }catch{}
                        
                    }else if Int(price) == order.price {
                        
                        
                        //                        let entity2 = NSEntityDescription.insertNewObject(forEntityName: "TotalPrice", into: moc) as! TotalPrice
                        //                        entity2.totalPrice = 0
                        
                        foundResults.last?.totalPrice = 0
                        
                        
                        do {
                            
                            try self.moc.save()
                            
                        }catch{}
                        
                    }
                    
                    
                    
                    
                    
                }
                
                
                
            }
            
        }catch{}
        
        
        let request: NSFetchRequest<Order> = Order.fetchRequest()
        request.predicate = NSPredicate(format: "objectId == %@", order.objectId!)
        
        do {
            let searchResults = try moc.fetch(request)
            
            
            if searchResults.count > 0  {
                
                cell.quantityLabel.isHidden = false
                cell.deleteOrderButton.isHidden = false
                
                
                
                self.moc.delete(searchResults.last!)
                
                do {
                    
                    try self.moc.save()
                    
                    self.updateCellInfo(cell: cell, order: order)
                    
                    self.refreshOrders()
                    
                    
                }catch{}
                
                
                
                print("its more than zero")
                
                
                
                
            }else{
                
                cell.quantityLabel.isHidden = true
                cell.deleteOrderButton.isHidden = true
            }
            
        } catch {
            //            loadingObjectsView.isHidden = true
            print("Error with request: \(error)")
            
            
        }
        
        
    }
    
    func updateCellInfo(cell: FoodKindDetailsCollectionViewCell, order: Food){
        
        
        let request: NSFetchRequest<Order> = Order.fetchRequest()
        request.predicate = NSPredicate(format: "objectId == %@", order.objectId!)
        
        do {
            
            let results = try self.moc.fetch(request)
            if results.count > 0 {
                
                cell.quantityLabel.isHidden = false
                cell.deleteOrderButton.isHidden = false
                
                if let lastOrder = results.last {
                    
                    cell.quantityLabel.text = "\(Int(lastOrder.quantity))"
                }
                
                
            }else{
                
                cell.quantityLabel.isHidden = true
                cell.deleteOrderButton.isHidden = true
                
            }
            
            
        }catch{}
    }
    
    
    
    
    
    func refreshOrders(){
        
        let request: NSFetchRequest<TotalPrice> = TotalPrice.fetchRequest()
        
        do {
            
            let results = try self.moc.fetch(request)
            
            if results.count > 0 {
                
                
                if self.priceLabel.isHidden {
                    
                    self.priceLabel.isHidden = false
                }
                
                
                
                self.priceLabel.text = "Ghc \(Int((results.last?.totalPrice)!)).00"
                self.shoppingCartLabel.isEnabled = true
                
                
                
            }else{
                
                self.priceLabel.text = "Ghc 0.00"
                self.priceLabel.isHidden = true
                self.shoppingCartLabel.isEnabled = false

                
                let entity1 = NSEntityDescription.insertNewObject(forEntityName: "TotalPrice", into: moc) as! TotalPrice
                entity1.totalPrice = 0
                
                
                do {
                    
                    try self.moc.save()
                    
                }catch{}
                
                
                
            }
            
        }catch{}
        
        
        
        
        let queryTotalOrders: NSFetchRequest<Order> = Order.fetchRequest()
        
        do {
            
            let foundResults = try self.moc.fetch(queryTotalOrders)
            
            if foundResults.count > 0 {
                
                
                
                if self.totalQuantityLabel.isHidden {
                    
                    self.totalQuantityLabel.isHidden = false
                    
                }
                
                self.totalQuantityLabel.text = "\(foundResults.count)"
                
                
                
            }else if foundResults.count == 0 {
                
                self.totalQuantityLabel.text = ""
                self.totalQuantityLabel.isHidden = true
                
            }
            
        }catch{}
        
        
        
        
    }
   
    
    
    
    func saveOrderToCoreData(order: Food , cell: FoodKindDetailsCollectionViewCell){
        
//        let queryTotalOrders: NSFetchRequest<TotalPrice> = TotalPrice.fetchRequest()
//
//        do {
//
//            let foundResults = try self.moc.fetch(queryTotalOrders)
//
//            if foundResults.count > 0 {
//
//
//                if var price = foundResults.last?.totalPrice {
//
//                    price = price + Int32(order.price!)
//
//                    //                    let entity1 = NSEntityDescription.insertNewObject(forEntityName: "TotalPrice", into: moc) as! TotalPrice
//                    //                     entity1.totalPrice = price
//
//                    foundResults.last?.totalPrice = price
//
//                    do {
//
//                        try self.moc.save()
//
//                    }catch{}
//
//
//
//                }
//
//
//
//            }else{
//
//                let entity1 = NSEntityDescription.insertNewObject(forEntityName: "TotalPrice", into: moc) as! TotalPrice
//                entity1.totalPrice = Int32(order.price!)
//
//                do {
//
//                    try self.moc.save()
//
//                }catch{}
//
//
//
//            }
//
//        }catch{}
//
//
//        var quantity: Int32 = 0
//
//
//        let request: NSFetchRequest<Order> = Order.fetchRequest()
//        request.predicate = NSPredicate(format: "objectId == %@", order.objectId!)
//
//        do {
//            let searchResults = try moc.fetch(request)
//
//            if searchResults.count > 0  {
//
//                quantity = (searchResults.last?.quantity)! + 1
//
//
//            }else{
//
//                quantity = 1
//
//
//            }
//
//        } catch {}
//
//
//        cell.quantityLabel.text = "\(Int(quantity))"
//
//        let entity = NSEntityDescription.insertNewObject(forEntityName: "Order", into: moc) as! Order
//
//        entity.createdAt = order.createdAt
//        entity.objectId = order.objectId
//        entity.quantity = quantity
//        entity.itemImageURL = order.thumbnailImageURL
////        entity.sellerId = order.seller?.objectId
//        entity.price = Int32(order.price!)
//        entity.descritpion = order.orderDescription
//        entity.nameOfOrder = order.foodTitle
//        
//        print("this is quantity \(quantity)")
//
//
//        do {
//
//            try moc.save()
//
//            print("saved to coredata successfully")
//
//            self.refreshOrders()
//
//
//        }catch{}
//
//
//
//
        
        
    }
    
    
    func updatePriceLabel(){
        
        //        let attributedMutableText = NSMutableAttributedString(string: "Pay", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18), NSForegroundColorAttributeName: UIColor.white])
        //
        //        let atrributedText = NSAttributedString(string: "\nGhc 50.00", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.lightGray])
        //        attributedMutableText.append(atrributedText)
        //
        //        let paragraphStyle = NSMutableParagraphStyle()
        //        paragraphStyle.lineSpacing = 4
        //
        //        attributedMutableText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedMutableText.string.characters.count))
        //
        //        shoppingCartLabel.attributedText = attributedMutableText
        
    }
    
    @objc func handlePayOrder(){
        
        
        
        let request: NSFetchRequest<TotalPrice> = TotalPrice.fetchRequest()
        
        do {
            
            let results = try self.moc.fetch(request)
            
            print(results.count)
            
            if results.count > 0 {
                
                if shoppingCartLabel.isEnabled == true {
                    
                    
//                    let layout = UICollectionViewFlowLayout()
//                    layout.minimumLineSpacing = 2
//                    let confirmOrderVC = ConfirmOrderCollectionViewController(collectionViewLayout: layout)
////                    if let totalPrice = results
////                    confirmOrderVC.navigationItem.title = "\()"
//                    self.navigationController?.pushViewController(confirmOrderVC, animated: true)
//
//
                    
                    
                }
                
              
            }
            
        }catch{}
        
        
        
        
        
        //      let layout = UICollectionViewFlowLayout()
        //      layout.minimumLineSpacing = 2
        //      let confirmOrderVC = ConfirmOrderCollectionViewController(collectionViewLayout: layout)
        //        if quantityOfFoodOrderedArray.count > 0 {
        //
        //            confirmOrderVC.orders = quantityOfFoodOrderedArray
        //
        //        }
        //      self.navigationController?.pushViewController(confirmOrderVC, animated: true)
        //
        
    }
    
    
    func setUpViews(){
        
        self.view.addSubview(cartContainerView)
        cartContainerView.addSubview(shoppingCartLabel)
        cartContainerView.addSubview(cartImageView)
        cartContainerView.addSubview(priceLabel)
        cartContainerView.addSubview(totalQuantityLabel)
        
        totalQuantityLabel.centerYAnchor.constraint(equalTo: cartImageView.centerYAnchor, constant: -15).isActive = true
        totalQuantityLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        totalQuantityLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        totalQuantityLabel.centerXAnchor.constraint(equalTo: cartImageView.centerXAnchor, constant: 10).isActive = true
        
        
        priceLabel.leftAnchor.constraint(equalTo: cartImageView.rightAnchor, constant: 8).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: shoppingCartLabel.leftAnchor).isActive = true
        priceLabel.centerYAnchor.constraint(equalTo: cartContainerView.centerYAnchor).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        cartImageView.leftAnchor.constraint(equalTo: cartContainerView.leftAnchor, constant: 8).isActive = true
        cartImageView.bottomAnchor.constraint(equalTo: cartContainerView.bottomAnchor, constant: -8).isActive = true
        cartImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        cartImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        cartContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cartContainerView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0).isActive = true
        cartContainerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        cartContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        shoppingCartLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        shoppingCartLabel.rightAnchor.constraint(equalTo: cartContainerView.rightAnchor,constant: 0).isActive = true
        shoppingCartLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shoppingCartLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.backgroundColor = defaultAppColor
        navigationController?.navigationBar.barTintColor = defaultAppColor
        UIApplication.shared.statusBarStyle = .lightContent
//        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        navigationController?.isNavigationBarHidden = false
        
    }
    
    
    @objc func handleAddOrder(sender: UIButton){
        
        
        
        let point = sender.convert(sender.bounds.origin, to: collectionView)
        if let indexPath = collectionView?.indexPathForItem(at: point) {
            
            
            if let cell = collectionView?.cellForItem(at: indexPath) as? FoodKindDetailsCollectionViewCell{
                let selectedItem = self.foodArray[indexPath.item]
                
                
                
                //                if (cell.quantityLabel.text?.isEmpty)! {
                
                print("ok")
                
                
                self.saveOrderToCoreData(order: selectedItem, cell: cell)
                
                
                cell.deleteOrderButton.isHidden = false
                cell.quantityLabel.isHidden = false
                
                totalQuantityLabel.isHidden = false
                shoppingCartLabel.isEnabled = true
                
                
                
                
                //                }
                
            }
            
        }
        
        
    }
    
    @objc func handleModifyOrder(sender: UIButton){
        
        let point = sender.convert(sender.bounds.origin, to: collectionView)
        if let indexPath = collectionView?.indexPathForItem(at: point) {
            
            let selectedItem = self.foodArray[indexPath.item]
            
            if let cell = collectionView?.cellForItem(at: indexPath) as? FoodKindDetailsCollectionViewCell{
                
                self.queryandUpdateCoreData(order: selectedItem, cell: cell)
                
            }
            
            
            
            
            
            //            if let price = selectedItem.price {
            //
            //                if totalPrice > price {
            //
            //                    self.totalPrice = totalPrice - price
            //
            //                    self.priceLabel.text = "Ghc \(totalPrice).00"
            //
            //
            //                }
            //            }
            //
            //
            //            if quantityOfFoodOrderedArray.count > 1 {
            //
            //                quantityOfFoodOrderedArray.remove(at: indexPath.item - 1)
            //
            //            }else{
            //
            //                quantityOfFoodOrderedArray.remove(at: 0)
            //
            //
            //            }
            //
            //
            //
            //
            //            if let cell = collectionView?.cellForItem(at: indexPath) as? FoodKindDetailsCollectionViewCell{
            //
            //                if !(cell.quantityLabel.text?.isEmpty)! {
            //
            //
            //                    var intQuantity = Int(cell.quantityLabel.text!)
            //
            //                    if intQuantity! > 0 {
            //
            ////                        let currentQty = intQuantity! - 1
            //
            //
            ////                            cell.deleteOrderButton.isHidden = true
            ////                            cell.quantityLabel.text = ""
            ////                            cell.quantityLabel.isHidden = true
            //
            //
            //
            //                            intQuantity = intQuantity! - 1
            //
            //
            //
            //
            //                        if intQuantity == 0 {
            //
            //                            cell.deleteOrderButton.isHidden = true
            //                            cell.quantityLabel.text = ""
            //                            cell.quantityLabel.isHidden = true
            //
            //
            //
            //                        }else{
            //
            //                            cell.quantityLabel.text = "\(String(describing: intQuantity!))"
            //                            cell.deleteOrderButton.isHidden = false
            //                            cell.quantityLabel.isHidden = false
            //                        }
            //
            //
            //
            //
            //                        totalQuantityOrdered = totalQuantityOrdered - 1
            //
            //                        if totalQuantityOrdered == 0 {
            //
            //                            totalQuantityLabel.isHidden = true
            //
            //                            shoppingCartLabel.isEnabled = false
            //
            //
            //
            //                        }else{
            //
            //                            totalQuantityLabel.isHidden = false
            //                            totalQuantityLabel.text = "\(totalQuantityOrdered)"
            //
            //
            //
            //                        }
            //
            //
            //
            //
            //
            //
            //                    }else if intQuantity! == 0{
            //
            //                        cell.deleteOrderButton.isHidden = true
            //                        cell.quantityLabel.text = ""
            //                        cell.quantityLabel.isHidden = true
            //
            //                        if totalQuantityOrdered == 0 {
            //
            //                            totalQuantityOrdered = 0
            //                            totalQuantityLabel.isHidden = true
            //
            //
            //                        }
            //
            //                    }
            //
            //
            //
            //                }
            //
            //
            //            }
            //
        }
        //
        
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.foodArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FoodKindDetailsCollectionViewCell
        
        cell.layer.cornerRadius = 4
        cell.clipsToBounds = true
        cell.backgroundColor = .white
        
        cell.incomingVC = self
        
        let foodItem = self.foodArray[indexPath.item]
        cell.priceLabel.text = "Ghc \(String(describing: foodItem.price!))"
        cell.titleLabel.text = foodItem.foodTitle
        
        
        if let urlString = foodItem.thumbnailImageURL {
            
//            cell.itemDisplayImage.sd_setImage(with: URL(string: urlString), placeholderImage: #imageLiteral(resourceName: "personplaceholder"))
            
        }
        
        
        let request: NSFetchRequest<Order> = Order.fetchRequest()
        request.predicate = NSPredicate(format: "objectId == %@", foodItem.objectId!)
        
        do {
            let results = try moc.fetch(request)
            
            
            if results.count > 0  {
                
                // save the new user if the user doesn't exis
                
                for result in results {
                    
                    cell.deleteOrderButton.isHidden = false
                    cell.quantityLabel.text = "\(Int(result.quantity))"
                    cell.quantityLabel.isHidden = false
                    
                }
                
                
            }else{
                
                cell.deleteOrderButton.isHidden = true
                cell.quantityLabel.isHidden = true
                
                
                
                
            }
            
        } catch {
            //            loadingObjectsView.isHidden = true
            print("Error with request: \(error)")
            
            
        }
        
        
        
        
        
        
        
        cell.addButton.addTarget(self, action: #selector(handleAddOrder), for: .touchUpInside)
        cell.deleteOrderButton.addTarget(self, action: #selector(handleModifyOrder), for: .touchUpInside)
        
        //        let attributedMutableText = NSMutableAttributedString(string: "Burger", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.black])
        //
        //        
        //        let atrributedText = NSAttributedString(string: "\nGhc 5.00", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.red])
        //        attributedMutableText.append(atrributedText)
        //        
        //        let paragraphStyle = NSMutableParagraphStyle()
        //        paragraphStyle.lineSpacing = 4
        //        
        //        attributedMutableText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedMutableText.string.characters.count))
        //        
        //        cell.titleLabel.attributedText = attributedMutableText
        
        
        
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.view.frame.width  / 3) - 1
        
        return CGSize(width: width, height: 250)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    

}
