//
//  HomeViewController.swift
//  ViPay
//
//  Created by Rock on 2018/7/30.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,PassDataDelegate {
    
    
    func changeTitle(title: String) {
        
    }
    
    
    let customNavContainerView: BaseImageView = {
        let v = BaseImageView(frame: .zero)
//        v.image = #imageLiteral(resourceName: "Background")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.isUserInteractionEnabled = true
//        v.isHidden = true
        return v
    }()
    
  
    let homeNavBarLabel: BaseLabel = {
        let label = BaseLabel()
        label.font = UIFont(name: FontNames.OpenSansBold, size: 18)
        label.textAlignment = .center
        label.text = "ViPay"
        label.textColor = .white
        return label
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
    
    lazy var myqrCode: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "icon_qr")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleShowMyQRCode)))
        return v
    }()
    
    lazy var scanQrCode: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "iconQrscan")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleScan)))
        return v
    }()
    
    private let identifier = "identifier"
    private let headerI = "headerI"

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        customNavContainerView.image = #imageLiteral(resourceName: "Background")
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        //-44.0
    
        if targetContentOffset.pointee.y < 10.0 {
            
            customNavContainerView.image = UIImage()

            
        }else{
            
            customNavContainerView.image = #imageLiteral(resourceName: "Background")

        }
        
    }
    
    
    
    func setUpViews(){
        
        view.addSubview(collectionView)
        view.addSubview(customNavContainerView)
        customNavContainerView.addSubview(myqrCode)
        customNavContainerView.addSubview(scanQrCode)
        customNavContainerView.addSubview(homeNavBarLabel)
        
        
        homeNavBarLabel.rightAnchor.constraint(equalTo: myqrCode.leftAnchor, constant: -8).isActive = true
        homeNavBarLabel.leftAnchor.constraint(equalTo: scanQrCode.rightAnchor, constant: 8).isActive = true
        homeNavBarLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
        homeNavBarLabel.centerYAnchor.constraint(equalTo: scanQrCode.centerYAnchor).isActive = true

        
        myqrCode.rightAnchor.constraint(equalTo: customNavContainerView.rightAnchor, constant: -15).isActive = true
        if UIDevice.current.isIphoneX {
            
            myqrCode.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 15).isActive = true

            
        }else{
            
            myqrCode.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 10).isActive = true

        }
        myqrCode.widthAnchor.constraint(equalToConstant: 26).isActive = true
        myqrCode.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        
        scanQrCode.leftAnchor.constraint(equalTo: customNavContainerView.leftAnchor, constant: 15).isActive = true
        if UIDevice.current.isIphoneX {
            
            scanQrCode.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 15).isActive = true

            
        }else{
            
            scanQrCode.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 10).isActive = true

        }
        scanQrCode.widthAnchor.constraint(equalToConstant: 26).isActive = true
        scanQrCode.heightAnchor.constraint(equalToConstant: 26).isActive = true

        
        collectionView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: 0).isActive = true
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.isNavigationBarHidden = true
        
       
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
        
    }
    
    @objc func handleLikeButtonTapped(sender: UIButton){
        
        let point = sender.convert(sender.bounds.origin, to: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: point)
        if let cell = self.collectionView.cellForItem(at: indexPath!) as? HomeCollectionViewCell{
            
            if cell.likeButton.currentBackgroundImage == #imageLiteral(resourceName: "liked") {
                cell.likeButton.setBackgroundImage(#imageLiteral(resourceName: "like").imageWithTintColor(color: defaultAppColor), for: .normal)

            }else{
                
                cell.likeButton.setBackgroundImage(#imageLiteral(resourceName: "liked"), for: .normal)

                
            }
            
        }
            
            
        
        
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
        
        cell.layer.cornerRadius = 24
        cell.backgroundColor = .white
        cell.layer.borderWidth = 0.2
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.shadowColor = RGB.sharedInstance.requiredColor(r: 0, g: 165, b: 255, alpha: 0.3).cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0.75)
        cell.layer.shadowRadius = 3
        cell.layer.shadowOpacity = 0.1
        
        cell.likeButton.addTarget(self, action: #selector(handleLikeButtonTapped), for: .touchUpInside)
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 362)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var headerV: HomeHeaderCollectionReusableView?
        
        headerV = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerI, for: indexPath) as? HomeHeaderCollectionReusableView
      headerV?.profileImageView.isUserInteractionEnabled = true
        headerV?.profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleMyPosts)))
        return headerV!
    }
    
    
    @objc func handleMyPosts(){
        
        let layout = UICollectionViewFlowLayout()
        let mypostsVC = MyPostsCollectionViewController(collectionViewLayout: layout)
        mypostsVC.hidesBottomBarWhenPushed = true 
        self.navigationController?.pushViewController(mypostsVC, animated: true)
        
    }
    
    
    
    @objc func handleScan(){
        let scanVC = SccanQRCodeViewController()
        scanVC.passDataDelegate = self
        let nav = UINavigationController(rootViewController: scanVC)
        self.present(nav, animated: true, completion: nil)

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
