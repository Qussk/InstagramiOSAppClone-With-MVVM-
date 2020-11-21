//
//  CustomTextField.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/21.
//

import UIKit

class CustomTextField : UITextField {
  
  init(placeholder: String) {
    super.init(frame: .zero)
    
    let spacer = UIView()
    spacer.setDimensions(height: 50, width: 12)
    leftView = spacer
    leftViewMode = .always
    
    
    borderStyle = .none
    textColor = .white
    keyboardAppearance = .dark
    keyboardType = .emailAddress
    backgroundColor = UIColor(white: 1, alpha: 0.2)
    setHeight(50)
    attributedPlaceholder =
      NSAttributedString(string: placeholder,
                         attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7) ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
