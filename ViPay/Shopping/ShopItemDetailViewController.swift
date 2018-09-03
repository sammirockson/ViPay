//
//  ShopItemDetailViewController.swift
//  ViPay
//
//  Created by Rock on 2018/8/24.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

class ShopItemDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.text = "0"
        label.font = UIFont(name: FontNames.OpenSansSemiBold, size: 14)
        label.textColor = defaultAppColor
        label.numberOfLines = 0
        return label
        
    }()
    
    
    let cartImageView: UIImageView = {
        let imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.image = #imageLiteral(resourceName: "shoppingCart")
        return imageV
        
    }()
    
   
    
    let customNavContainerView: UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.isUserInteractionEnabled = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(#imageLiteral(resourceName: "iconArrowBack"), for: .normal)
        btn.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var backButtonContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
        v.layer.cornerRadius = 20
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleBackButton)))
        return v
    }()
    
    lazy var rightMoreContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
        v.layer.cornerRadius = 20
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleShare)))
        return v
    }()
    
    lazy var moreImageView: UIImageView = {
        let v = UIImageView()
        v.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
        v.clipsToBounds = true
        v.image = #imageLiteral(resourceName: "option").imageWithTintColor(color: .white)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleShare)))
        return v
    }()
    
    lazy var bottomContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var nextButton: UIButton = {
        let v = UIButton()
        v.setBackgroundImage(#imageLiteral(resourceName: "backgrounGradientImage"), for: .normal)
        v.setTitle("Next", for: .normal)
        v.setTitleColor(.white, for: .normal)
        v.titleLabel?.font = UIFont(name: FontNames.OpenSansSemiBold, size: 18)
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        v.addTarget(self, action: #selector(handleCompletePurchase), for: .touchUpInside)
        return v
    }()
    
    lazy var addToCartButton: UIButton = {
        let v = UIButton()
//        v.setBackgroundImage(#imageLiteral(resourceName: "backgrounGradientImage"), for: .normal)
        v.setTitle("Add to cart", for: .normal)
        v.setTitleColor(defaultAppColor, for: .normal)
        v.layer.borderWidth = 0.5
        v.layer.borderColor = defaultAppColor.cgColor
        v.titleLabel?.font = UIFont(name: FontNames.OpenSansSemiBold, size: 18)
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    lazy var thirdSpaceContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var chatSellerButton: UIButton = {
        let v = UIButton()
        v.setImage(#imageLiteral(resourceName: "ChatsUnaelecteed").imageWithTintColor(color: defaultAppColor), for: .normal)
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    private let identifier = "identifier"
    private let headerId = "headerId"

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        view.backgroundColor = .white
        collectionView.register(ShoppingCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.register(ShopItemDetailReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func handleCompletePurchase(){
        
        let confVC = ConfirmOrderViewController()
        navigationController?.pushViewController(confVC, animated: true)
        
    }
    
    
    @objc func handleShare(){
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Send to Chat", style: .default, handler: { (action) in
            
        }))
        alert.addAction(UIAlertAction(title: "Share to Feed", style: .default, handler: { (action) in
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
    @objc func handleBackButton(){
        
        navigationController?.popViewController(animated: true)
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
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        
        customNavContainerView.image = UIImage()
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ShoppingCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2), height: 320)

//        return CGSize(width: view.frame.width / 2, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var headerView: ShopItemDetailReusableView?
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as? ShopItemDetailReusableView
        headerView?.backgroundColor = UIColor.groupTableViewBackground
        return headerView!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 800)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
       
        if targetContentOffset.pointee.y < 10.0 {
            
            customNavContainerView.image = UIImage()
            customNavContainerView.backgroundColor = UIColor.clear
            
            
        }else{
            
            customNavContainerView.backgroundColor = UIColor(white: 0.8, alpha: 0.8)
            
            
        }
        
    }

    
    
    func setUpViews(){
        
        
        let frame = view.frame
        
        self.view.addSubview(collectionView)
        self.view.addSubview(bottomContainerView)
        
        bottomContainerView.addSubview(nextButton)
        bottomContainerView.addSubview(addToCartButton)
        bottomContainerView.addSubview(thirdSpaceContainerView)
        
        thirdSpaceContainerView.addSubview(chatSellerButton)
        
        chatSellerButton.centerYAnchor.constraint(equalTo: thirdSpaceContainerView.centerYAnchor).isActive = true
        chatSellerButton.centerXAnchor.constraint(equalTo: thirdSpaceContainerView.centerXAnchor).isActive = true
        chatSellerButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        chatSellerButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        thirdSpaceContainerView.rightAnchor.constraint(equalTo: addToCartButton.leftAnchor).isActive = true
        thirdSpaceContainerView.heightAnchor.constraint(equalTo: bottomContainerView.heightAnchor).isActive = true
        thirdSpaceContainerView.widthAnchor.constraint(equalToConstant: frame.width / 3).isActive = true
        thirdSpaceContainerView.centerYAnchor.constraint(equalTo: bottomContainerView.centerYAnchor).isActive = true
        
        addToCartButton.rightAnchor.constraint(equalTo: nextButton.leftAnchor).isActive = true
        addToCartButton.heightAnchor.constraint(equalTo: bottomContainerView.heightAnchor).isActive = true
        addToCartButton.widthAnchor.constraint(equalToConstant: frame.width / 3).isActive = true
        addToCartButton.centerYAnchor.constraint(equalTo: bottomContainerView.centerYAnchor).isActive = true
        
        nextButton.rightAnchor.constraint(equalTo: bottomContainerView.rightAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalTo: bottomContainerView.heightAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: frame.width / 3).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: bottomContainerView.centerYAnchor).isActive = true
        
        MyConstraints.sharedInstance.pinWithHeight(motherView: view, viewToPin: bottomContainerView, leftMargin: 0, rightMargin: 0, topMargin: nil, bottomMargin: 0, height: 50, width: nil)
        
        MyConstraints.sharedInstance.pinConstraints(motherView: self.view, viewToPin: collectionView, leftMargin: 0, rightMargin: 0, topMargin: 0, bottomMargin: 0)
        
        view.addSubview(customNavContainerView)
        customNavContainerView.addSubview(backButtonContainerView)
        backButtonContainerView.addSubview(backButton)
        
        customNavContainerView.addSubview(rightMoreContainerView)
        rightMoreContainerView.addSubview(moreImageView)
        
        
        moreImageView.centerYAnchor.constraint(equalTo: rightMoreContainerView.centerYAnchor).isActive = true
        moreImageView.centerXAnchor.constraint(equalTo: rightMoreContainerView.centerXAnchor).isActive = true
        moreImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        moreImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        if UIDevice.current.isIphoneX {
            
            rightMoreContainerView.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 15).isActive = true
            
            
        }else{
            
            rightMoreContainerView.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 10).isActive = true
            
        }
        rightMoreContainerView.rightAnchor.constraint(equalTo: customNavContainerView.rightAnchor, constant: -15).isActive = true
        rightMoreContainerView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        rightMoreContainerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        backButton.centerYAnchor.constraint(equalTo: backButtonContainerView.centerYAnchor).isActive = true
        backButton.centerXAnchor.constraint(equalTo: backButtonContainerView.centerXAnchor).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        if UIDevice.current.isIphoneX {
            
            backButtonContainerView.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 15).isActive = true
            
            
        }else{
            
            backButtonContainerView.centerYAnchor.constraint(equalTo: customNavContainerView.centerYAnchor, constant: 10).isActive = true
            
        }
        backButtonContainerView.leftAnchor.constraint(equalTo: customNavContainerView.leftAnchor, constant: 15).isActive = true
        backButtonContainerView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backButtonContainerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        customNavContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        customNavContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        customNavContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        if UIDevice.current.isIphoneX {
            
            customNavContainerView.heightAnchor.constraint(equalToConstant: 90).isActive = true
            
            
        }else{
            
            customNavContainerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
        }
    }
    

}
