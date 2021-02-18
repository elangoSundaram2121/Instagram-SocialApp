//
//  RegisterController.swift
//  InstagramSocialApp
//
//  Created by Balachandar S on 16/02/21.
//  Copyright © 2021 Balachandar S. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {
    
    let authService = AuthService()
    
    //MARK : PROPERTIES
    
    var profileImage : UIImage?
    
    
    private let plusPhotoIcon : UIButton = {
           
           let button = UIButton(type: .system)
           button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
           button.tintColor = .white
           button.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
           return button
       }()
    
    private let emailTextField : CustomTextField = {
        let textField = CustomTextField(placeholder: "Email")
        return textField
    }()
    
    private let passwordTextField : CustomTextField = {
          let textField = CustomTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
          return textField
      }()
    
    private let fullNameTextField : CustomTextField = {
             
             let tf = CustomTextField(placeholder: "Fullname")
             return tf
         }()
         
         private let userNameTextField : CustomTextField = {
             
             let tf = CustomTextField(placeholder: "Username")
             return tf
         }()
    
    private let signUpButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("SignUp", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setHeight(40)
        button.layer.cornerRadius = 5
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAcntButton : UIButton = {
    
        let button = UIButton()
        button.attributedText(firstPart: "Dont have a account?  ", secondPart: "SignUP")
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        return button
    }()
    
    //MARK : ACTIONS
    
    @objc private func handleSignUp(){
        guard let email = emailTextField.text else{return}
        guard let pass = passwordTextField.text else{return}
        guard let userName = userNameTextField.text else{return}
        guard let fullName = fullNameTextField.text else{return}
        guard let profileImage = profileImage else{return}
        

        
        let authCredentials = AuthCredentials(email: email, password: pass, userName: userName, fullName: fullName, profileImage: profileImage)
        
        AuthService.registerUser(userCredentials: authCredentials) { (error) in
            
            if let error = error{
                print("Cant able to register in Firebase \(error.localizedDescription)")
            }else{
                print("Succesfully register in firebase")
                self.dismiss(animated: true, completion: nil)
            }
            
        }
           
    }
    
    @objc private func handleLogin(){
           
        
        
       }
    
    @objc private func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    //MARK : LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradientColor()
        configureUI()
        
    }
    
    //MARK : HELPERS
    
    func configureUI(){
        
        navigationController?.navigationBar.isHidden = true
            navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(plusPhotoIcon)
               plusPhotoIcon.centerX(inView: view)
               plusPhotoIcon.setDimensions(height: 140, width: 140)
               plusPhotoIcon.anchor(top: view.safeAreaLayoutGuide.topAnchor,paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,fullNameTextField,userNameTextField,signUpButton])
        stack.axis = .vertical
        stack.spacing = 10
        
        view.addSubview(stack)
        stack.anchor(top : plusPhotoIcon.bottomAnchor,left: view.safeAreaLayoutGuide.leftAnchor,right: view.safeAreaLayoutGuide.rightAnchor,paddingTop: 20,paddingLeft: 20,paddingRight: 20)
        
        view.addSubview(dontHaveAcntButton)
        dontHaveAcntButton.centerX(inView: view)
        dontHaveAcntButton.anchor(bottom : view.safeAreaLayoutGuide.bottomAnchor,paddingBottom: 12)
        
    }
    
    
}

extension RegisterController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {return}
        profileImage = selectedImage
        plusPhotoIcon.layer.cornerRadius = plusPhotoIcon.frame.width/2
            plusPhotoIcon.layer.masksToBounds = true
            plusPhotoIcon.layer.borderColor = UIColor.white.cgColor
            plusPhotoIcon.layer.borderWidth = 2
        plusPhotoIcon.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
