//
//  MyPostsCollectionViewController.swift
//  ViPay
//
//  Created by Rock on 2018/8/4.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MyPostsCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    
    let headerId = "headerId"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.register(MyPostsCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        
        let leftNavBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Arrow Left").imageWithTintColor(color: .white), style: .done, target: self, action: #selector(handleBackButton))
        navigationItem.setLeftBarButton(leftNavBarButton, animated: true)
        
        collectionView?.backgroundColor = UIColor.groupTableViewBackground
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func handleBackButton(){
        
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 320)

    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var headerView: MyPostsCollectionReusableView?
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as? MyPostsCollectionReusableView
        headerView?.backgroundColor = UIColor.groupTableViewBackground
        return headerView!
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
