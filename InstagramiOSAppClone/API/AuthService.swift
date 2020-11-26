//
//  AuthService.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/23.
//

import UIKit
import Firebase

struct AuthCredentials {
  let email: String
  let password: String
  let fullname: String
  let username: String
  let profileImage: UIImage
}

struct AuthService {
 
  static func logUserin(whitEamil email: String, password: String, complcation: AuthDataResultCallback?){
    Auth.auth().signIn(withEmail: email, password: password, completion: complcation)
  }
  
  static func registerUser(withCredential credentials: AuthCredentials, completion: @escaping (Error?) -> Void) {
    
    ImageUploader.uploadImage(image: credentials.profileImage) { imageUrl in
      Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in
        
        if let error = error {
          print("DEBUG: register 실패 (error.localizedDescription)")
          return
        }
        
        guard let uid = result?.user.uid else { return }
        
        //보낼 형식
        let data: [String:Any] = ["email":credentials.email,
                                  "fullname": credentials.fullname,
                                  "profileImageURL": imageUrl,
                                  "uid": uid,
                                  "username": credentials.username]
        
        //users컬렉션에 넣기
        Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
      }
    }
  }
}
