//
//  SearchProductsViewController.swift
//  ViPay
//
//  Created by Rock on 2018/9/4.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit
import SnapKit
import Parse
import SVProgressHUD


class SearchProductsViewController: UIViewController, UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let customNavContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.groupTableViewBackground
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.isUserInteractionEnabled = true
        v.layer.borderWidth = 0.2
        v.layer.borderColor = UIColor(white: 0.8, alpha: 0.6).cgColor
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let searchContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 16
        v.clipsToBounds = true
        return v
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search products"
        textField.backgroundColor = .clear
        textField.clipsToBounds = true
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textField.returnKeyType = .done
        return textField
    }()
    
    lazy var cancelButton: UILabel = {
        let label = UILabel()
        label.text = "Cancel"
        label.textAlignment = .center
        label.font = OptimizedFont.font(fontName: FontNames.OpenSansSemiBold, fontSize: 14)
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCancelButtonTapped)))
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 2
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var isSearching = false
    
    var cachedTexts = [String]()
    var searchResults = [PFObject]()
    
    fileprivate let identifier = "identifier"
    fileprivate let cachedIdentifier = "cachedIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.groupTableViewBackground
        setUpViews()
        
        searchResults = [PFObject(className: "Check"),PFObject(className: "Hi"),PFObject(className: "Hello"), PFObject(className: "Check"),PFObject(className: "Hi"),PFObject(className: "Hello"),PFObject(className: "Check"),PFObject(className: "Hi"),PFObject(className: "Hello")]
        
        collectionView.register(CachedSearchViewCell.self, forCellWithReuseIdentifier: cachedIdentifier)
        collectionView.register(ShoppingCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        
        cachedTexts = ["Adiddas", "Air Jordan", "MacBook Pro 2018","Adiddas Air", "Nike Air Jordan", "MacBook Pro 2018","Adidda", "Air Jordan Off White 456 Oregon, ILlenoi", "MacBook Pro 2018","Adidda", "Air Jordan", "MacBook Pro 2018","Adidda", "Air Jordan Air Jordan Off White 456 Oregon, ILlenoi", "MacBook Pro 2018"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.searchTextField.becomeFirstResponder()
        collectionView.contentInset = UIEdgeInsetsMake(8, 0, 0, 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(8, 0, 0, 0)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        navigationController?.isNavigationBarHidden = true
        UIApplication.shared.statusBarStyle = .default
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
        UIApplication.shared.statusBarStyle = .lightContent

        
    }
    
    @objc func handleCancelButtonTapped(){
        self.searchTextField.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func textFieldDidChange(){
        
        let searchString = self.searchTextField.text!
        
        if searchString.utf8.count == 0 {
            self.isSearching = false
            self.collectionView.reloadData()
        }else{
            self.isSearching = true
            self.collectionView.reloadData()
            
            self.findProduct(searchString: searchString)

        }
        
    }
    
    
    
    func findProduct(searchString: String){
        
        SVProgressHUD.show()
        let query = PFQuery(className: "Products")
        query.whereKey("searchTag", matchesRegex: "(?i)\(searchString)")
        query.cachePolicy = PFCachePolicy.cacheThenNetwork
        query.findObjectsInBackground { (results, error) in
            
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
            }
            
            if error == nil {
                
                if (results?.count)! > 0 {
                    self.searchResults = results!
                    
                    DispatchQueue.main.async {
                        self.isSearching = true
                        self.collectionView.reloadData()
                    }
                }
                
            }
        }

    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func setUpViews(){
        
        view.addSubview(customNavContainerView)
        customNavContainerView.addSubview(cancelButton)
        customNavContainerView.addSubview(searchContainerView)
        searchContainerView.addSubview(searchTextField)
        
       
        
        searchTextField.snp.makeConstraints { (make) in
            make.right.equalTo(cancelButton.snp.left).offset(-8)
            make.left.equalToSuperview().offset(18)
            make.height.equalTo(34)
            make.centerY.equalToSuperview()
        }
        
        searchContainerView.snp.makeConstraints { (make) in
            make.right.equalTo(cancelButton.snp.left).offset(-8)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(34)
            if UIDevice.current.isIphoneX{
                make.centerY.equalToSuperview().offset(15)
            }else{
                make.centerY.equalToSuperview().offset(10)
            }
        }
        
        cancelButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            if UIDevice.current.isIphoneX{
              make.centerY.equalToSuperview().offset(15)
            }else{
                make.centerY.equalToSuperview().offset(10)

            }
            make.width.equalTo(60)
            make.height.equalTo(30)

            
        }
        
        view.addSubview(collectionView)
      
        collectionView.topAnchor.constraint(equalTo: customNavContainerView.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        
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

extension SearchProductsViewController{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.isSearching {
            return self.searchResults.count
        }else{
            return self.cachedTexts.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.isSearching {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ShoppingCollectionViewCell
            cell.backgroundColor = .clear
            cell.layer.cornerRadius = 8
            cell.clipsToBounds = true
            
            let product = self.searchResults[indexPath.item]
            cell.processAndDisplay(product: product)
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cachedIdentifier, for: indexPath) as! CachedSearchViewCell
            cell.layer.cornerRadius = 16
            cell.clipsToBounds = true
            cell.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
            cell.titleLabel.text = self.cachedTexts[indexPath.item]
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if self.isSearching{
            return CGSize(width: view.frame.width / 2, height: 300)
            
        }else{
            
            let item = self.cachedTexts[indexPath.item]
            let width = self.estimatedRect(statusText: item).width + 20
            return CGSize(width: width, height: 34)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if self.isSearching {
            let product = self.searchResults[indexPath.item]
            let detailVC = ShopItemDetailViewController()
            detailVC.product = product
            detailVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(detailVC, animated: true)
        }else{
            
            let searchString = self.cachedTexts[indexPath.item]
            print(searchString)
            self.findProduct(searchString: searchString)
        }
    }
    
    func estimatedRect(statusText: String) -> CGRect {
        return NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width - 100, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font: OptimizedFont.font(fontName: FontNames.OpenSansRegular, fontSize: 14)], context: nil)
    }
 
}
