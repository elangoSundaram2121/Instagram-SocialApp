//
//  LoginController.swift
//  InstagramSocialApp
//
//  Created by Balachandar S on 04/02/21.
//  Copyright © 2021 Balachandar S. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    //MARK : PROPERTIES
    
    private let iconImageView : UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let emailTextField : CustomTextField = {
        let textField = CustomTextField(placeholder: "Email")
        return textField
    }()
    
    private let passwordTextField : CustomTextField = {
          let textField = CustomTextField(placeholder: "Email")
        textField.isSecureTextEntry = true
          return textField
      }()
    
    private let loginButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setHeight(40)
        button.layer.cornerRadius = 5
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let forgetYourPassButton : UIButton = {
        
        let button = UIButton()
        button.attributedText(firstPart: "Forget your password?  ", secondPart: "Get help signing in")
        button.addTarget(self, action: #selector(handleForegetPassword), for: .touchUpInside)

        return button
    }()
    
    private let dontHaveAcntButton : UIButton = {
    
        let button = UIButton()
        button.attributedText(firstPart: "Dont have a account?  ", secondPart: "SignUP")
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)

        return button
    }()
    
    //MARK : LIFECYCLES
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradientColor()
        configureUI()
    }
    
    //MARK : Actions
    
    @objc private func handleLogin(){
        
        
        
    }
    
    @objc private func handleForegetPassword(){
           
           
           
       }
    
    @objc private func handleSignUp(){
           
           
           
       }
    
    
    
    //MARK : HELPERS
    
    func configureUI(){
        
        view.addSubview(iconImageView)
        iconImageView.centerX(inView: view)
        iconImageView.anchor(top : view.safeAreaLayoutGuide.topAnchor,paddingTop: 30)
        iconImageView.setDimensions(height: 60, width: 120)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,loginButton])
        stack.axis = .vertical
        stack.spacing = 10
        
        view.addSubview(stack)
        stack.anchor(top : iconImageView.bottomAnchor,left: view.safeAreaLayoutGuide.leftAnchor,right: view.safeAreaLayoutGuide.rightAnchor,paddingTop: 20,paddingLeft: 20,paddingRight: 20)
        
        view.addSubview(forgetYourPassButton)
        forgetYourPassButton.centerX(inView: stack)
        forgetYourPassButton.anchor(top : stack.bottomAnchor,paddingTop: 22)
        
        view.addSubview(dontHaveAcntButton)
        dontHaveAcntButton.centerX(inView: view)
        dontHaveAcntButton.anchor(bottom : view.safeAreaLayoutGuide.bottomAnchor,paddingBottom: 12)
        
    }
    
    
    
    
    
}
