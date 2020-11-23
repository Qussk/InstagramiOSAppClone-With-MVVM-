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
  static func registerUser(withCredential credentials: AuthCredentials){
    print("debug: credntials are \(credentials)")
  }
}
