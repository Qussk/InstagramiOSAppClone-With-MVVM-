//
//  AuthenticationViewModel.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/23.
//

import UIKit


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




struct RegisterationViewModel{
  
}

