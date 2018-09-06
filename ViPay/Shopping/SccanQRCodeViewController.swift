//
//  SccanQRCodeViewController.swift
//  ScanQRCode
//
//  Created by Rock on 2018/9/4.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation

protocol PassDataDelegate: class{
    func changeTitle(title: String)
}


class SccanQRCodeViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    var player: AVAudioPlayer!
    
    let captureFocusFrame: UIImageView = {
        let v = UIImageView()
        v.image = #imageLiteral(resourceName: "ScanFocus")
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    lazy var backButton: UIImageView = {
        let imageV = UIImageView()
        imageV.image = #imageLiteral(resourceName: "iconArrowBack")
        imageV.contentMode = .scaleAspectFit
        imageV.isUserInteractionEnabled = true
        imageV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleBackTapped)))
        return imageV
    }()
    
    
    weak var passDataDelegate: PassDataDelegate?
    let darkView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "扫码"
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
        
        checkCameraAccess()
        
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { (make) in
            if UIDevice.current.isIphoneX {
                make.top.equalToSuperview().offset(40)
            }else{
                make.top.equalToSuperview().offset(35)
            }
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(34)
            make.height.equalTo(20)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @objc func handleBackTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
        
    }
 
    
    func animate(){
        
        let hintImageView = UIImageView()
        hintImageView.image = #imageLiteral(resourceName: "scanQRCodeAnimation")
        captureFocusFrame.addSubview(hintImageView)
        hintImageView.center = captureFocusFrame.center
        hintImageView.frame = CGRect(x: 0, y: 0, width: 250, height: 4)
        
        UIView.animate(withDuration: 1.5, delay: 0, options: [.repeat, .autoreverse] , animations: {
            hintImageView.frame = CGRect(x: 0, y: 245, width: 250, height: 4);
        }) { (completed) in
            
        }
        
    }
    
    
    func metadataOutput(_ captureOutput: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {

        if let firstObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject{
        
            self.playSound()
            self.captureSession?.stopRunning()
            
            switch firstObject.type {
            case AVMetadataObject.ObjectType.qr:
                //This is QRCode. I guess its obvious
                self.getStringAndGoBack(firstObject: firstObject)
//            case .ean13:
//                //This is BarCode
//             self.getStringAndGoBack(firstObject: firstObject)
            default:
                print("Hello world")
  
            }
            
            self.handleBackTapped()

            
        }else{
            
            self.handleBackTapped()

        }

    }
    
    func getStringAndGoBack(firstObject: AVMetadataMachineReadableCodeObject){
        if let foundString = firstObject.stringValue {
            self.passDataDelegate?.changeTitle(title: foundString)
            self.handleBackTapped()
        }
      
    }
    
    
}





extension SccanQRCodeViewController{
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "QRCodeBeepSound", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func checkCameraAccess() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .denied:
            print("Denied, request permission from settings")
            presentCameraSettings()
        case .restricted:
            print("Restricted, device owner must approve")
            presentCameraSettings()
        case .authorized:
            print("Authorized, proceed")
            self.setUpScan()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { success in
                if success {
                    print("Permission granted, proceed")
                    DispatchQueue.main.async {
                        self.setUpScan()
                    }
                } else {
                    print("Permission denied")
                }
            }
        }
    }
    
    func presentCameraSettings() {
        let alertController = UIAlertController(title: "IMPORTANT",
                                                message: "Please grant us camera access.",
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default))
        alertController.addAction(UIAlertAction(title: "Settings", style: .cancel) { _ in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: { _ in
                        // Handle
                    })
                } else {
                    // Fallback on earlier versions
                }
            }
        })
        
        present(alertController, animated: true)
    }
    
    
    
    
    
    func setUpScan(){
        
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        do {
            
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr,.ean13]

            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = self.view.layer.bounds
            
            self.view.layer.addSublayer(videoPreviewLayer!)
            view.layer.backgroundColor = UIColor.red.cgColor
            
            captureSession?.startRunning()
            
            view.addSubview(darkView)
            darkView.frame = view.frame
            darkView.image = #imageLiteral(resourceName: "FullFrame")
            darkView.contentMode = .scaleAspectFit
            darkView.center = view.center
            
            self.view.addSubview(captureFocusFrame)
            captureFocusFrame.snp.makeConstraints { (make) in
                make.height.equalTo(250)
                make.width.equalTo(250)
                make.centerY.equalToSuperview()
                make.centerX.equalToSuperview()
            }
            
            self.animate()
            
            
        }catch{
            
            print(error)
        }
        
        
    }
    

   
}
