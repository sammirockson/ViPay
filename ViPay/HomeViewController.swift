//
//  HomeViewController.swift
//  ViPay
//
//  Created by Rock on 2018/7/30.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let customNavContainerView: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "Background")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.isHidden = true
        return v
    }()
    
  
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = UIColor(white: 0.9, alpha: 0.9)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private let identifier = "identifier"
    private let headerI = "headerI"

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionView.contentInset = UIEdgeInsetsMake(8, 0, 0, 0)
//        collectionView.scrollIndicatorInsets =  UIEdgeInsetsMake(8, 0, 0, 0)
        
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.register(HomeHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerI)
        view.backgroundColor = UIColor(white: 0.9, alpha: 0.9)
        setUpViews()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        
        customNavContainerView.isHidden = false
        
    }
    
    
    
    
    func setUpViews(){
        
        view.addSubview(customNavContainerView)
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        customNavContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        customNavContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        customNavContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        customNavContainerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HomeCollectionViewCell
        cell.backgroundColor = .white
//        cell.layer.cornerRadius = 24
//        cell.clipsToBounds = true
        
        cell.layer.cornerRadius = 24
        cell.backgroundColor = .white
        cell.layer.borderWidth = 0.2
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.shadowColor = RGB.sharedInstance.requiredColor(r: 0, g: 165, b: 255, alpha: 0.3).cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0.75)
        cell.layer.shadowRadius = 3
        cell.layer.shadowOpacity = 0.1
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 362)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var headerV: HomeHeaderCollectionReusableView?
        
        headerV = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerI, for: indexPath) as? HomeHeaderCollectionReusableView
        headerV?.myqrCode.isUserInteractionEnabled = true
        headerV?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleShowMyQRCode)))
        return headerV!
    }
    
    @objc func handleShowMyQRCode(){
        
        let myqrcodeVC = MyQRCodeViewController()
        myqrcodeVC.hidesBottomBarWhenPushed = true 
        self.navigationController?.pushViewController(myqrcodeVC, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }

}
