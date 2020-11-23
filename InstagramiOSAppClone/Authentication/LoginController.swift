//
//  LoginController.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/21.
//

import UIKit

class LoginController: UIViewController {
  //MARK:-Proreties
  
  private var viewModel = LoginViewModel()
  
  private let iconimage : UIImageView = {
    let iv = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
    iv.contentMode = .scaleAspectFill
    return iv
  }()
  
  private let emailTextfield : CustomTextField = {
    let tf = CustomTextField(placeholder: "이메일")
    tf.keyboardType = .emailAddress
    return tf
    
  }()
  private let passwordTextfield : UITextField = {
    let tf = CustomTextField(placeholder: "비밀번호")
    tf.isSecureTextEntry = true
    return tf
  }()
  
  private let loginButton: UIButton = {
    let button = UIButton()
    button.setTitle("로그인", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 5
    button.setHeight(50)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    return button
  }()
  
  private let forgotPasswordButton: UIButton = {
    let button = UIButton(type: .system)
    button.attributedTitle(firstPart: "비밀번호를 잊으셨나요? ", secondPart: "비밀번호 찾기")
    button.addTarget(self, action: #selector(handleShowSingUP), for: .touchUpInside)
    return button
  }()
  
  private let dontHaveAccountButton: UIButton = {
    let button = UIButton(type: .system)
    button.attributedTitle(firstPart: "계정이 없으신가요 ? ", secondPart: "가입하기")
    return button
  }()
  
  
  //MARK:- life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    configureNotificationObservers()
   
  }
  
  //MARK:-  Action
  
  @objc func handleShowSingUP(){
    print("debug: singUP 누름")
    let controller = RegistrationController()
    navigationController?.pushViewController(controller, animated: true)
  }
  
  @objc func textDidChange(sender: UITextField){
    if sender == emailTextfield {
      viewModel.email = sender.text
    }else{
      viewModel.password = sender.text
    }
    print("debug: ViewModel email : \(viewModel.email), password : \(viewModel.password)")
    print("debug: ViewModel formIsValid : \(viewModel.formIsValid)")
  
    //뷰모델에서 가져오기.
    loginButton.backgroundColor = viewModel.buttonBackgroundColor
    loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
    loginButton.isEnabled = viewModel.formIsValid
  }
  
  
  func setUI(){
    contigureGradientLayer()
    view.backgroundColor = .white
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black
    
  
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
  
  //tf : textDidChange
  func configureNotificationObservers(){
    emailTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    passwordTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
  }
}
