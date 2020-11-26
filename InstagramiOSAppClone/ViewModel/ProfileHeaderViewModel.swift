//
//  ProfileHeaderViewModel.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/26.
//

import Foundation

struct ProfileHeaderViewModel {
  var user: User
  
  var fullname: String {
    return user.fullname
  }
  
  var profileImageUrl: URL? {
    return URL(string: user.profileImageUrl)
  }
  
  init(user: User) {
    self.user = user
  }
}
