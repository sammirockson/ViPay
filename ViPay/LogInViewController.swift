//
//  LogInViewController.swift
//  ViPay
//
//  Created by Rock on 2018/8/27.
//  Copyright © 2018 RockzAppStudio. All rights reserved.
//

import UIKit
import Parse
import SVProgressHUD



class LogInViewController: UIViewController, UITextFieldDelegate {
    
    lazy var backgrounImageView: BaseImageView = {
        let v = BaseImageView(frame: .zero)
        v.image = #imageLiteral(resourceName: "backgrounGradientImage")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissKeyboard)))
        return v
    }()
    
    let usernameContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 8
        v.clipsToBounds = true
        return v
    }()
    
    lazy var usernameTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.textColor = .white
        label.font = OptimizedFont.font(fontName: FontNames.OpenSansSemiBold, fontSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleAnimateUsernameTitle)))
        return label
    }()
    
    lazy var usernameTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.font = OptimizedFont.font(fontName: FontNames.OpenSansSemiBold, fontSize: 16)
        txtField.textColor = .white
        txtField.autocorrectionType = .no
        txtField.delegate = self
        return txtField
    }()
    
    let passwordContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 8
        v.clipsToBounds = true
        return v
    }()
    
    lazy var passwordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .white
        label.font = OptimizedFont.font(fontName: FontNames.OpenSansSemiBold, fontSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleAnimatePasswordTitle)))
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.font = OptimizedFont.font(fontName: FontNames.OpenSansSemiBold, fontSize: 16)
        txtField.textColor = .white
        txtField.autocorrectionType = .no
        txtField.isSecureTextEntry = true
        txtField.delegate = self
        return txtField
    }()
    
    lazy var loginButton: UIButton = {
        let v = UIButton()
        v.setBackgroundImage(#imageLiteral(resourceName: "Background"), for: .normal)
//        v.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 8
        v.setTitle("Log In", for: .normal)
        v.titleLabel?.font = OptimizedFont.font(fontName: FontNames.OpenSansSemiBold, fontSize: 18)
        v.setTitleColor(.white, for: .normal)
        v.clipsToBounds = true
        v.addTarget(self, action: #selector(handleLoginTapped), for: .touchUpInside)
        return v
    }()
    
    lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSignUp)))
        return label
    }()
    
    let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = "Forgot password?"
        label.font = OptimizedFont.font(fontName: FontNames.OpenSansSemiBold, fontSize: 14)
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpViews()
        
        UIApplication.shared.statusBarStyle = .lightContent

        
        
        let attributedString = NSMutableAttributedString(string: "Don’t have an account? Sign Up", attributes: [
            .font: OptimizedFont.font(fontName: FontNames.OpenSansRegular, fontSize: 16),
            .foregroundColor: UIColor(white: 1.0, alpha: 1.0)
            ])
        attributedString.addAttribute(.font, value: OptimizedFont.font(fontName: FontNames.OpenSansBold, fontSize: 16), range: NSRange(location: 23, length: 7))
        signUpLabel.attributedText = attributedString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
        
    }
    
    @objc func handleDismissKeyboard(){
        
        view.endEditing(true)
        
    }
    
    
    @objc func handleLoginTapped(){
        
        if (usernameTextField.text?.isEmpty)! {
            Alerts.shareInstance.alertDisplay(vc: self, reason: "Username field is empty")
            return
        }
        
        if (passwordTextField.text?.isEmpty)! {
            Alerts.shareInstance.alertDisplay(vc: self, reason: "Password field is empty")
            return
        }
        
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        DarkOverLay.sharedInstance.show()
        SVProgressHUD.show(withStatus: "Logging In...")
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            
            DispatchQueue.main.async {
                
            DarkOverLay.sharedInstance.dismiss()
            SVProgressHUD.dismiss()
                
            }
            
            if error == nil {
                
                DispatchQueue.main.async {
                    
                    let homeVC = CustomTabBarController()
                    self.navigationController?.pushViewController(homeVC, animated: true)
                }
                
            }else{
                
                DispatchQueue.main.async {
                    CustomAlerts.sharedInstance.showAlert(message: (error?.localizedDescription)!, image: #imageLiteral(resourceName: "iconWarning"))
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2), execute: {
                        CustomAlerts.sharedInstance.dismiss()
                    })
                }
            }
        }
        
    }
    
    
    @objc func handleSignUp(){
        
        let veriVC = VerifyPhoneViewController()
        navigationController?.pushViewController(veriVC, animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == usernameTextField {
            
            if textField.text?.utf8.count == 0 {
                
                self.animateBackDown(constraint: usernameHeightConstraint!, titleLabel: usernameTitleLabel)

            }
        }
        
        if textField == passwordTextField {
            
            if textField.text?.utf8.count == 0 {
                
                self.animateBackDown(constraint: passwordHeightConstraint!, titleLabel: passwordTitleLabel)
                
            }
        }
    }
    
    @objc func handleAnimateUsernameTitle(){
        
        self.animateTitle(constraint: usernameHeightConstraint!, titleLabel: usernameTitleLabel)
        
    }
    
    @objc func handleAnimatePasswordTitle(){
        
        self.animateTitle(constraint: passwordHeightConstraint!, titleLabel: passwordTitleLabel)

    }
    
    
    func animateBackDown(constraint: NSLayoutConstraint, titleLabel: UILabel){
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            constraint.constant = 42
            titleLabel.font = OptimizedFont.font(fontName: FontNames.OpenSansSemiBold, fontSize: 14)
            self.view.layoutIfNeeded()
            
            
        }) { (completed) in
          
            
        }
        
    }
    
    func animateTitle(constraint: NSLayoutConstraint, titleLabel: UILabel){
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            constraint.constant = 18
            titleLabel.font = OptimizedFont.font(fontName: FontNames.OpenSansSemiBold, fontSize: 12)
            self.view.layoutIfNeeded()
            
            
        }) { (completed) in
            
            if titleLabel == self.usernameTitleLabel {
                
                self.usernameTextField.becomeFirstResponder()
            }
            
            if titleLabel == self.passwordTitleLabel {
                
                self.passwordTextField.becomeFirstResponder()
            }
            
            
        }
    }
    
    var usernameHeightConstraint: NSLayoutConstraint?
    var passwordHeightConstraint: NSLayoutConstraint?

    
    func setUpViews(){
        
        view.addSubview(backgrounImageView)
        
        
        view.addSubview(usernameContainerView)
        usernameContainerView.addSubview(usernameTitleLabel)
        usernameContainerView.addSubview(usernameTextField)
        
        usernameTextField.topAnchor.constraint(equalTo: usernameTitleLabel.bottomAnchor).isActive = true
        usernameTextField.bottomAnchor.constraint(equalTo: usernameContainerView.bottomAnchor, constant: -4).isActive = true
        usernameTextField.rightAnchor.constraint(equalTo: usernameContainerView.rightAnchor, constant: -8).isActive = true
        usernameTextField.leftAnchor.constraint(equalTo: usernameContainerView.leftAnchor, constant: 8).isActive = true
        
        usernameTitleLabel.topAnchor.constraint(equalTo: usernameContainerView.topAnchor, constant: 4).isActive = true
        usernameTitleLabel.rightAnchor.constraint(equalTo: usernameContainerView.rightAnchor, constant: -8).isActive = true
        usernameTitleLabel.leftAnchor.constraint(equalTo: usernameContainerView.leftAnchor, constant: 10).isActive = true
        usernameHeightConstraint = usernameTitleLabel.heightAnchor.constraint(equalToConstant: 42)
        usernameHeightConstraint?.isActive = true
        
        
        view.addSubview(passwordContainerView)
        passwordContainerView.addSubview(passwordTitleLabel)
        passwordContainerView.addSubview(passwordTextField)
        
        view.addSubview(forgotPasswordLabel)
        
        forgotPasswordLabel.rightAnchor.constraint(equalTo: passwordContainerView.rightAnchor).isActive = true
        forgotPasswordLabel.leftAnchor.constraint(equalTo: passwordContainerView.leftAnchor).isActive = true
        forgotPasswordLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        forgotPasswordLabel.topAnchor.constraint(equalTo: passwordContainerView.bottomAnchor, constant: 10).isActive = true
        
        
        view.addSubview(loginButton)
        view.addSubview(signUpLabel)
        
        
        if #available(iOS 11.0, *) {
            signUpLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        } else {
            // Fallback on earlier versions
            signUpLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true

        }
        
        signUpLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        signUpLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        signUpLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        loginButton.topAnchor.constraint(equalTo: passwordContainerView.bottomAnchor, constant: 80).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: passwordTitleLabel.bottomAnchor).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: passwordContainerView.bottomAnchor, constant: -4).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: passwordContainerView.rightAnchor, constant: -8).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: passwordContainerView.leftAnchor, constant: 8).isActive = true
        
        passwordTitleLabel.topAnchor.constraint(equalTo: passwordContainerView.topAnchor, constant: 4).isActive = true
        passwordTitleLabel.rightAnchor.constraint(equalTo: passwordContainerView.rightAnchor, constant: -8).isActive = true
        passwordTitleLabel.leftAnchor.constraint(equalTo: passwordContainerView.leftAnchor, constant: 10).isActive = true
        passwordHeightConstraint = passwordTitleLabel.heightAnchor.constraint(equalToConstant: 42)
        passwordHeightConstraint?.isActive = true
        
        passwordContainerView.topAnchor.constraint(equalTo: usernameContainerView.bottomAnchor, constant: 15).isActive = true
        passwordContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        passwordContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        usernameContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        usernameContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        usernameContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        usernameContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        MyConstraints.sharedInstance.pinConstraints(motherView: view, viewToPin: backgrounImageView, leftMargin: 0, rightMargin: 0, topMargin: 0, bottomMargin: 0)
        
        
    }
    


}
