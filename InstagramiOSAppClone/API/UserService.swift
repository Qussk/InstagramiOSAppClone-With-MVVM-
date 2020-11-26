//
//  UserService.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/26.
//

import Firebase

struct UserService {
  static func fetchUser(completion: @escaping(User) -> Void){
    guard let uid = Auth.auth().currentUser?.uid else { return }
    COLLECTION_USERS.document(uid).getDocument { snapshot, error in
      guard let dictionary = snapshot?.data() else { return } //딕셔너리값 가져옴
      
      //딕셔너리 초기값 Model의 User에 넣음
      print("DEBUG: snapshot\(snapshot?.data())")
      
      let user = User(dictionaty: dictionary)
      completion(user)
    }
  }
}

