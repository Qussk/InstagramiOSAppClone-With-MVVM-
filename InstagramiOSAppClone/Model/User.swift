//
//  User.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/26.
//

import Foundation

//object user
struct User {
  let email: String
  let fullname: String
  let username: String
  let profileImageUrl: String
  let uid: String
  
  init(dictionaty: [String: Any]) {
    self.email = dictionaty["email"] as? String ?? ""
    self.fullname = dictionaty["fullname"] as? String ?? ""
    self.username = dictionaty["username"] as? String ?? ""
    self.profileImageUrl = dictionaty["profileImageURL"] as? String ?? ""
    self.uid = dictionaty["uid"] as? String ?? ""
  }
}
