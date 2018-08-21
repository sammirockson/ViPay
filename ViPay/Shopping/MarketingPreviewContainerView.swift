//
//  MarketingPreviewContainerView.swift
//  cryptowallet
//
//  Created by Rock on 2018/7/9.
//  Copyright © 2018 Cybermiles. All rights reserved.
//

import UIKit

struct MarketPreview {
    var icon: UIImage
    var title: String
}

class MarketingPreviewContainerView: UIView,  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        return cv
    }()
    
    
    let trackLoc = NSLocalizedString( "Easily track and store all your cryptocurrencies.", comment: "")
    let transferLoc = NSLocalizedString("Instantly transfer cryptocurrency to friends.", comment: "")
    let stayOntopLoc = NSLocalizedString("Stay on top of the latest crypto trends.", comment: "")
    let earnMoney = NSLocalizedString("Earn more with professionally-managed investing.", comment: "")
    
    lazy var arrayOfMarketItems: [MarketPreview] = {
        let one = MarketPreview(icon: #imageLiteral(resourceName: "shanghai"), title: trackLoc)
        let two = MarketPreview(icon: #imageLiteral(resourceName: "shanghai"), title: transferLoc)
        let three = MarketPreview(icon: #imageLiteral(resourceName: "shanghai"), title: stayOntopLoc)
        let four = MarketPreview(icon: #imageLiteral(resourceName: "shanghai"), title: earnMoney)
        return [one,two,three,four]
    }()
    
    lazy var scrollIndicatorContainerView: MarketIndicatorContainerView = {
        let v = MarketIndicatorContainerView()
        v.backgroundColor = .clear
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var motherContainer: ShoppingViewController?
    var cellie: ShoppingHeaderCollectionReusableView?
    
    let identifier = "identifier"

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        
        collectionView.register(MarketPreviewCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        
        self.addSubview(collectionView)
        self.addSubview(scrollIndicatorContainerView)


        
//        if UIDevice.current.isIphoneX {
//
//            scrollIndicatorContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -35).isActive = true
//
//        }else{
//
//
//        }
        
        
        scrollIndicatorContainerView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -30).isActive = true
        scrollIndicatorContainerView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        scrollIndicatorContainerView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        scrollIndicatorContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayOfMarketItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MarketPreviewCollectionViewCell
        cell.backgroundColor = .clear
        let item = self.arrayOfMarketItems[indexPath.item]
        cell.icon.image = item.icon
//        cell.title.text = item.title
        
        
        let attributed = NSMutableAttributedString(string: item.title, attributes: [NSAttributedStringKey.font: UIFont(name: FontNames.OpenSansSemiBold, size: 18) as Any, NSAttributedStringKey.strokeColor: UIColor.white as Any])
       
        
        if indexPath.item == 2 || indexPath.item == 3 {
        
            let comingSoonLoca = NSLocalizedString(" (coming soon)", comment: "")
            
             let sentAttribute = NSAttributedString(string: comingSoonLoca, attributes: [NSAttributedStringKey.foregroundColor: RGB.sharedInstance.requiredColor(r: 157, g: 165, b: 178, alpha: 1.0),NSAttributedStringKey.font : UIFont(name: FontNames.OpenSansRegular, size: 12) as Any])
            
            attributed.append(sentAttribute)
            cell.title.attributedText = attributed


        }else{

             let sentAttribute = NSAttributedString(string: "", attributes: [NSAttributedStringKey.foregroundColor: UIColor.clear,NSAttributedStringKey.font : UIFont(name: FontNames.OpenSansRegular, size: 12) as Any])

            attributed.append(sentAttribute)
            cell.title.attributedText = attributed


        }
    

      
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = targetContentOffset.pointee.x / self.frame.width
        let indexP = Int(pageNumber)
        self.motherContainer?.indexItem = indexP
        
        if  let visibleCells = scrollIndicatorContainerView.collectionView.visibleCells as? [IndicatorCellCollectionViewCell] {
        for cell in visibleCells {
            
            if  let indexPath = scrollIndicatorContainerView.collectionView.indexPath(for: cell){
                
                if indexPath.item == indexP {
                    
                    cell.indicatorBlueColorView.isHidden = false
                    
                }else{
                    
                    cell.indicatorBlueColorView.isHidden = true

                }
                
            }
          
            }
        }
    }
    

    

    
}
