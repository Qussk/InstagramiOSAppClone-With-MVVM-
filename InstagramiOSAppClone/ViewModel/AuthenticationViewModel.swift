//
//  AuthenticationViewModel.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/23.
//

import UIKit

protocol FormviewModel {
  func updateForm()
}

protocol AuthenticationViewModel {
  var formIsValid: Bool { get }
  var buttonBackgroundColor: UIColor { get }
  var buttonTitleColor: UIColor { get }
}


//로그인
struct LoginViewModel{
  var email: String?
  var password: String?
  
  
  //isEnabled 변경 소스
  var formIsValid: Bool{
    return email?.isEmpty == false && password?.isEmpty == false
  }
  
  var buttonBackgroundColor: UIColor {
    return formIsValid ? #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
  }
  
  var buttonTitleColor: UIColor {
    return formIsValid ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : UIColor(white: 1, alpha: 0.67)
  }
}



//회원가입(프로토콜 채택)
struct RegisterationViewModel: AuthenticationViewModel{
  var email: String?
  var password: String?
  var fullname: String?
  var username: String?

  var formIsValid: Bool {
    return email?.isEmpty == false && password?.isEmpty == false
      && fullname?.isEmpty == false && username?.isEmpty == false
  }
  
  var buttonBackgroundColor: UIColor {
    return formIsValid ? #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
  }
  
  var buttonTitleColor: UIColor {
    return formIsValid ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : UIColor(white: 1, alpha: 0.67)
  }
}

