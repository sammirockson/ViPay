//
//  FoodViewController.swift
//  ViPay
//
//  Created by Rock on 2018/8/19.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let customNavContainerView: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "Background")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.isUserInteractionEnabled = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
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
    
    let searchTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Search for restuarants or food"
        label.textColor = .lightGray
        label.font = UIFont(name: FontNames.OpenSansRegular, size: 12)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = UIColor.groupTableViewBackground
        return cv
    }()
    
    private let identifier = "identifier"
    private let headerId = "headerId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        view.backgroundColor = .white

        collectionView.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.register(FoodCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        
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
        
//        customNavContainerView.addSubview(navBarTitleLabel)
        
        customNavContainerView.addSubview(searchBarContainerView)
        searchBarContainerView.addSubview(searhcIcon)
        searchBarContainerView.addSubview(searchTitleLabel)
        
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: customNavContainerView.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
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
        

        
        customNavContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        customNavContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        customNavContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        if UIDevice.current.isIphoneX {
            
            customNavContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            
        }else{
            
            customNavContainerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
        }
        
    }
    
    
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FoodCollectionViewCell
        cell.backgroundColor = .white
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var headerCell: FoodCollectionReusableView?
        headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as? FoodCollectionReusableView
        headerCell?.backgroundColor = UIColor.groupTableViewBackground
        return headerCell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let layout = UICollectionViewFlowLayout()
        let foodKindVC = FoodKindDetailsCollectionViewController(collectionViewLayout: layout)
        foodKindVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(foodKindVC, animated: true)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 140)
    }

}
