//
//  FoodCategoryDeailtViewController.swift
//  ViPay
//
//  Created by Rock on 2018/8/24.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class FoodCategoryDeailtViewController: UIViewController {
    
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
        v.image = #imageLiteral(resourceName: "iconSearch")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let searchTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fast foods"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 16)
        return label
    }()
    
//    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        cv.delegate = self
//        cv.dataSource = self
//        cv.backgroundColor = UIColor.groupTableViewBackground
//        return cv
//    }()
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(#imageLiteral(resourceName: "iconArrowBack"), for: .normal)
        btn.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpViews()

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
    
    
    @objc func handleBackButton(){
        
        navigationController?.popViewController(animated: true)
    }
    
    
    func setUpViews(){
        
        view.addSubview(customNavContainerView)
        
        //        customNavContainerView.addSubview(navBarTitleLabel)
        
//        customNavContainerView.addSubview(searchBarContainerView)
        customNavContainerView.addSubview(backButton)
        customNavContainerView.addSubview(searhcIcon)
        customNavContainerView.addSubview(searchTitleLabel)


        
        
        if UIDevice.current.isIphoneX {
            
            backButton.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 15).isActive = true

            
        }else{
            
            backButton.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 10).isActive = true

        }
        backButton.leftAnchor.constraint(equalTo: customNavContainerView.leftAnchor, constant: 8).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
//        view.addSubview(collectionView)
//
//        collectionView.topAnchor.constraint(equalTo: customNavContainerView.bottomAnchor).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        searchTitleLabel.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 8).isActive = true
        searchTitleLabel.rightAnchor.constraint(equalTo: searhcIcon.leftAnchor, constant: -8).isActive = true
        searchTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        searchTitleLabel.centerYAnchor.constraint(equalTo: searhcIcon.centerYAnchor).isActive = true
        
        searhcIcon.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        searhcIcon.rightAnchor.constraint(equalTo: customNavContainerView.rightAnchor, constant: -15).isActive = true
        searhcIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        searhcIcon.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        
//        if UIDevice.current.isIphoneX {
//
//            searchBarContainerView.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 15).isActive = true
//
//        }else{
//
//            searchBarContainerView.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 10).isActive = true
//
//        }
//        searchBarContainerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        searchBarContainerView.rightAnchor.constraint(equalTo: customNavContainerView.rightAnchor, constant: -50).isActive = true
//        searchBarContainerView.leftAnchor.constraint(equalTo: customNavContainerView.leftAnchor, constant: 50).isActive = true
//
        
        
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
