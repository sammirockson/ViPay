//
//  ShoppingViewController.swift
//  ViPay
//
//  Created by Rock on 2018/8/13.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit
import Parse

class ShoppingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let customNavContainerView: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "Background")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.isUserInteractionEnabled = true
        return v
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = UIColor(white: 0.9, alpha: 0.9)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let searchBarContainerView: UIView = {
        let button = UIView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = defaultAppColor
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.alpha = 0.8
        return button
    }()
    
    let searhcIcon: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "iconSearch").imageWithTintColor(color: .lightGray)
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var searchTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Search for products e.g iPhone X, Bag, Ceramics"
        label.textColor = .lightGray
        label.font = UIFont(name: FontNames.OpenSansRegular, size: 12)
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSearchProduct)))
        return label
    }()
    
    var products = [PFObject]()
    var headerView: ShoppingHeaderCollectionReusableView?
    var scrollIndicatorContainerView: MarketIndicatorContainerView?
    
    let identifier = "identifier"
    private let headerReuseId = "headerReuseId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        view.backgroundColor = .white
        collectionView.backgroundColor = UIColor(white: 0.9, alpha: 0.9)

        collectionView.register(ShoppingCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        self.collectionView.register(ShoppingHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerReuseId)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(handleInfiniteLoop), userInfo: nil, repeats: true)
    }
    
   

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.isNavigationBarHidden = true
        
        self.timer?.fire()
        self.fetchProducts()
        
    }
    
    
    @objc func handleSearchProduct(){
        
        let searchVC = UINavigationController(rootViewController: SearchProductsViewController())
        self.present(searchVC, animated: false, completion: nil)
        
        
    }

    func fetchProducts(){
        let query = PFQuery(className: "Products")
        query.cachePolicy = PFCachePolicy.cacheThenNetwork
        query.findObjectsInBackground { (results, error) in
            if error == nil {
                
                if (results?.count)! > 0 {
                    
                    self.products.removeAll(keepingCapacity: true)
                    self.products = results!
                    
                    DispatchQueue.main.async {
                        
                        self.collectionView.reloadData()
                    }
                }
                
            }
        }
        
    }
    
    var indexItem = 0
    
    @objc func handleInfiniteLoop(){
        
        if indexItem == 4 {
            
            indexItem = 0
            
            let indexPath = IndexPath(item: indexItem, section: 0)
            self.headerView?.topContainerView.collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
            
            self.autoSCrollBlueIndicator(pageNumber: indexItem)
            
            
            
        }else{
            
            let indexPath = IndexPath(item: indexItem, section: 0)
            self.headerView?.topContainerView.collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
            self.autoSCrollBlueIndicator(pageNumber: indexItem)
            
            
            indexItem = indexItem + 1
            
        }
        
        
        
    }
    
    func autoSCrollBlueIndicator(pageNumber: Int){
        
        if  let visibleCells = scrollIndicatorContainerView?.collectionView.visibleCells as? [IndicatorCellCollectionViewCell] {
            for cell in visibleCells {
                
                if  let indexPath = scrollIndicatorContainerView?.collectionView.indexPath(for: cell){
                    
                    if indexPath.item == pageNumber {
                        
                        cell.indicatorBlueColorView.isHidden = false
                        
                    }else{
                        
                        cell.indicatorBlueColorView.isHidden = true
                        
                    }
                    
                }
                
            }
        }
        
    }
    
    var timer: Timer?
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        self.timer?.invalidate()
    }
    

    
   

}

extension ShoppingViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ShoppingCollectionViewCell
        cell.backgroundColor = .clear
        let product = self.products[indexPath.item]
        cell.processAndDisplay(product: product)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView: ShoppingHeaderCollectionReusableView?
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerReuseId, for: indexPath) as? ShoppingHeaderCollectionReusableView
        headerView?.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        
        self.headerView = headerView
        headerView?.topContainerView.motherContainer = self
        self.scrollIndicatorContainerView = headerView?.topContainerView.scrollIndicatorContainerView
        return headerView!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 800)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2), height: 320)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let product = self.products[indexPath.item]
        
        let detailVC = ShopItemDetailViewController()
        detailVC.product = product
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ShoppingViewController {
    
    func setUpViews(){
        
        view.addSubview(customNavContainerView)
        view.addSubview(collectionView)
        customNavContainerView.addSubview(searchBarContainerView)
        
        
        searchBarContainerView.addSubview(searhcIcon)
        searchBarContainerView.addSubview(searchTitleLabel)
        
        searchTitleLabel.leftAnchor.constraint(equalTo: searhcIcon.rightAnchor, constant: 8).isActive = true
        searchTitleLabel.rightAnchor.constraint(equalTo: searchBarContainerView.rightAnchor, constant: -8).isActive = true
        searchTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        searchTitleLabel.centerYAnchor.constraint(equalTo: searhcIcon.centerYAnchor).isActive = true
        
        searhcIcon.centerYAnchor.constraint(equalTo: searchBarContainerView.centerYAnchor).isActive = true
        searhcIcon.leftAnchor.constraint(equalTo: searchBarContainerView.leftAnchor, constant: 10).isActive = true
        searhcIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        searhcIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        if UIDevice.current.isIphoneX {
            
            searchBarContainerView.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 15).isActive = true
            
            
        }else{
            
            searchBarContainerView.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 10).isActive = true
            
        }
        searchBarContainerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchBarContainerView.rightAnchor.constraint(equalTo: customNavContainerView.rightAnchor, constant: -15).isActive = true
        searchBarContainerView.leftAnchor.constraint(equalTo: customNavContainerView.leftAnchor, constant: 15).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: customNavContainerView.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        customNavContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        customNavContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        customNavContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        if UIDevice.current.isIphoneX {
            
            customNavContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            
        }else{
            
            customNavContainerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
        }
        
    }
}
