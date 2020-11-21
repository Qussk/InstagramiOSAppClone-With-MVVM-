//
//  LoginController.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/21.
//

import UIKit

class LoginController: UIViewController {
  //MARK:-Proreties
  
  private let iconimage : UIImageView = {
    let iv = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
    iv.contentMode = .scaleAspectFill
    return iv
  }()
  
  private let emailTextfield : UITextField = {
    let tf = UITextField()
    tf.borderStyle = .none
    tf.textColor = .white
    tf.keyboardAppearance = .dark
    tf.keyboardType = .emailAddress
    tf.backgroundColor = UIColor(white: 1, alpha: 0.2)
    tf.setHeight(50)
    tf.attributedPlaceholder =
      NSAttributedString(string: "이메일",attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7) ])
    return tf
  }()
  private let passwordTextfield : UITextField = {
    let tf = UITextField()
    tf.borderStyle = .none
    tf.textColor = .white
    tf.keyboardAppearance = .dark
    tf.keyboardType = .emailAddress
    tf.backgroundColor = UIColor(white: 1, alpha: 0.2)
    tf.setHeight(50)
    tf.attributedPlaceholder =
      NSAttributedString(string: "비밀번호",attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7) ])
    tf.isSecureTextEntry = true
    return tf
  }()
  
  private let loginButton: UIButton = {
    let button = UIButton()
    button.setTitle("로그인", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    button.layer.cornerRadius = 5
    button.setHeight(50)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    return button
  }()
  
  private let forgotPasswordButton: UIButton = {
    let button = UIButton(type: .system)
    
    let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.systemFont(ofSize: 16)]
    let attrbutedTitle = NSMutableAttributedString(string: "비밀번호를 잊으셨나요? ", attributes: atts)
    let boldAtts : [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.boldSystemFont(ofSize: 16)]
    attrbutedTitle.append(NSAttributedString(string: "비밀번호 찾기", attributes: boldAtts))
    button.setAttributedTitle(attrbutedTitle, for: .normal)
    
    return button
  }()
  
  private let dontHaveAccountButton: UIButton = {
    let button = UIButton(type: .system)
    
    let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.systemFont(ofSize: 16)]
    let attrbutedTitle = NSMutableAttributedString(string: "계정이 없으신가요? ", attributes: atts)
    let boldAtts : [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.boldSystemFont(ofSize: 16)]
    attrbutedTitle.append(NSAttributedString(string: "가입하기", attributes: boldAtts))
    button.setAttributedTitle(attrbutedTitle, for: .normal)
    
    return button
  }()
  
  
  //MARK:- life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
   
  }
  
  
  func setUI(){
    view.backgroundColor = .white
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black
    
    let gradient = CAGradientLayer()
    gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
    gradient.locations = [0,1]
    view.layer.addSublayer(gradient)
    gradient.frame = view.frame
  
    view.addSubview(iconimage)
    iconimage.centerX(inView: view)
    iconimage.setDimensions(height: 80, width: 120)
    iconimage.anchor(top:view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    
    let stack = UIStackView(arrangedSubviews: [emailTextfield, passwordTextfield, loginButton, forgotPasswordButton])
    view.addSubview(stack)
    stack.axis = .vertical
    stack.spacing = 20
    stack.anchor(top: iconimage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    
    
    view.addSubview(dontHaveAccountButton)
    dontHaveAccountButton.centerX(inView: view)
    dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
  }
}
