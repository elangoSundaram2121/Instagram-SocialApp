//
//  AuthService.swift
//  InstagramSocialApp
//
//  Created by Balachandar S on 05/02/21.
//  Copyright © 2021 Balachandar S. All rights reserved.
//

import Firebase

struct AuthCredentials {
    
    let email : String
    let password : String
    let userName : String
    let fullName : String
    let profileImage : UIImage
}

struct AuthService {
    
  
        
    static func login(withEmail email: String,withPassword password: String,completion : AuthDataResultCallback?){
            
            Auth.auth().signIn(withEmail: email, password: password, completion: completion)
            
        }
        
    static func registerUser(userCredentials : AuthCredentials,completion : @escaping(Error?)-> Void){
        
        ImageUploader.uploadImage(image: userCredentials.profileImage) { (imageUrl) in
            
            Auth.auth().createUser(withEmail: userCredentials.email, password: userCredentials.password) { (result, error) in
                
                if let error = error{
                    print("cant able to register user \(error.localizedDescription)")
                }else{
                    guard let uid = result?.user.uid else{return}
                    
                    let data = ["email" : userCredentials.email,"userID" : uid,"username" : userCredentials.userName,"fullName" : userCredentials.fullName,"profileImageUrl" : imageUrl]
                    
                    Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
                }
                    
                
            }
            
        }
        
        
            
        }
    
}
