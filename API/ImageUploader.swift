//
//  ImageUploader.swift
//  InstagramSocialApp
//
//  Created by Balachandar S on 17/02/21.
//  Copyright © 2021 Balachandar S. All rights reserved.
//

import FirebaseStorage

struct ImageUploader{
    
    static func uploadImage(image: UIImage,completion : @escaping(String)->Void){
        
        guard let imageData = image.jpegData(compressionQuality: 0.75) else{
            return
        }
        
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        ref.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                print("Debug: Cant upload profile Image to firebase storage\(error.localizedDescription)")
                return
                
            }
            
            ref.downloadURL { (url, error) in
                guard let imageUrl = url?.absoluteString else {
                    return
                }
                completion(imageUrl)
            }
        }
        
    }
    
}

