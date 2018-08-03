//
//  MyQRCodeViewController.swift
//  GhPay
//
//  Created by Rockson on 08/09/2017.
//  Copyright © 2017 RockzAppStudio. All rights reserved.
//

import UIKit
import SVProgressHUD

class MyQRCodeViewController: UIViewController {
    
    let backgroundView: UIImageView = {
        let logingBG = UIImageView()
        logingBG.translatesAutoresizingMaskIntoConstraints = false
        logingBG.image = #imageLiteral(resourceName: "shanghai")
        logingBG.contentMode = .scaleAspectFill
        logingBG.clipsToBounds = true
        return logingBG
        
    }()
    
    let smallProfileImageView: UIImageView = {
        let logingBG = UIImageView()
        logingBG.translatesAutoresizingMaskIntoConstraints = false
        logingBG.image = #imageLiteral(resourceName: "shanghai")
        logingBG.contentMode = .scaleAspectFill
        logingBG.layer.cornerRadius = 20
        logingBG.clipsToBounds = true
        return logingBG
        
    }()
    
    let qrcodeImageView: UIImageView = {
        let logingBG = UIImageView()
        logingBG.translatesAutoresizingMaskIntoConstraints = false
        logingBG.image = #imageLiteral(resourceName: "shanghai")
        logingBG.contentMode = .scaleAspectFill
        logingBG.clipsToBounds = true
        logingBG.layer.cornerRadius = 4
        return logingBG
        
    }()
    
    
    let containerView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .white
        cv.layer.cornerRadius = 5
        cv.clipsToBounds = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
        
    }()
    
    
    let saveImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save image", for: .normal)
        button.setTitleColor(defaultAppColor, for: .normal)
        button.addTarget(self, action: #selector(handleSaveImage), for: .touchUpInside)
        return button
        
    }()
    
    
    lazy var refresh: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Refresh", for: .normal)
        button.addTarget(self, action: #selector(handleRefreshButton), for: .touchUpInside)
        button.setTitleColor(defaultAppColor, for: .normal)
        return button
        
    }()
    
    var qrcodeImage: CIImage!


    
    @objc func handleRefreshButton(){
        
        //refresh QRCode
//        if let currentUser = PFUser.current(){
        
            
            generateQRCode(inputString: "Rockson")
            
//        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setUpViews()
        
        view.backgroundColor = .white
        
       
     
        
//        if let currentUser = PFUser.current() {
        
            generateQRCode(inputString: "Lucky Wei Wei")

            
//            if let profileImageFile = currentUser.object(forKey: "profileImageFile") as? PFFile {
//
//                let url = URL(string: profileImageFile.url!)
//                self.smallProfileImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "personplaceholder"),progress: nil, completed: nil)
//
//            }
//        }

    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
      
        
        
    }
    
    
   @objc func handleSaveImage(){
    
     if let image = self.qrcodeImageView.image {
        
        UIImageWriteToSavedPhotosAlbum(image, nil, #selector(handleCompleted), nil)

     }
        

    }
    
    
    @objc func handleCompleted(){
        
        SVProgressHUD.showSuccess(withStatus: "Saved")

    
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) { (timer) in
            
            SVProgressHUD.dismiss()
        }
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        
        
        let navTitleLabel = UILabel(frame: CGRect(x: -30, y: 0, width: view.frame.width , height: 30))
        navTitleLabel.textColor = .white
        navTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        navTitleLabel.textAlignment = .center
        navTitleLabel.text = "Scan to Pay Me"
        navigationItem.titleView = navTitleLabel
        
    }
    
    func generateQRCode(inputString: String){
        
        let data = inputString.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setValue(data, forKey: "inputMessage")
        filter?.setValue("Q", forKey: "inputCorrectionLevel")
        self.qrcodeImage = filter?.outputImage
        
        let scaleX = 200 / qrcodeImage.extent.size.width
        let scaleY = 200 / qrcodeImage.extent.size.height
        
        
        let fineTransform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        let transformedImage = qrcodeImage.transformed(by: fineTransform)

        self.qrcodeImageView.image = UIImage(ciImage: transformedImage)
        
        

    }
    

    func setUpViews(){
        
        view.addSubview(backgroundView)
        view.addSubview(containerView)
        containerView.addSubview(qrcodeImageView)
        containerView.addSubview(smallProfileImageView)
        
        containerView.addSubview(saveImageButton)
        
        containerView.addSubview(refresh)
        
        refresh.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -8).isActive = true
        refresh.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        refresh.heightAnchor.constraint(equalToConstant: 20).isActive = true
        refresh.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        saveImageButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        saveImageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        saveImageButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        saveImageButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        smallProfileImageView.centerXAnchor.constraint(equalTo: qrcodeImageView.centerXAnchor).isActive = true
        smallProfileImageView.centerYAnchor.constraint(equalTo: qrcodeImageView.centerYAnchor).isActive = true
        smallProfileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        smallProfileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        qrcodeImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        qrcodeImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        qrcodeImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        qrcodeImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 340).isActive = true
        
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }

}
