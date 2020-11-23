//
//  RegistrationController.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/21.
//

import UIKit

class RegistrationController: UIViewController {
  //MARK:-Proreties
  
  private var viewModel = RegisterationViewModel()
  
  private let plusPhotoButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
    button.tintColor = .white
    return button
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
  
  private let fullnameTextfield = CustomTextField(placeholder: "이름")
  private let usernameTextfield = CustomTextField(placeholder: "닉네임")
  
  
  private let SignUpButton: UIButton = {
    let button = UIButton()
    button.setTitle("가입하기", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    button.layer.cornerRadius = 5
    button.setHeight(50)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    return button
  }()
  
  private let alreadyHaveAccountButton: UIButton = {
    let button = UIButton(type: .system)
    button.attributedTitle(firstPart: "로그인 페이지로 돌아가기. ", secondPart: "이전으로")
    button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
    return button
  }()
  
  //MARK:- life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    configureNotificationObservers()
    
  }

  //MARK:- Action
  @objc func handleShowLogin(){
    navigationController?.popViewController(animated: true)
  }
  
  @objc func textDidChange(sender: UITextField){
    if sender == emailTextfield {
      viewModel.email = sender.text
    }else if sender == passwordTextfield {
      viewModel.password = sender.text
    }else if sender == fullnameTextfield {
      viewModel.fullname = sender.text
    }else {
      viewModel.username = sender.text
    }
    print("debug: ViewModel email : \(viewModel.email), password : \(viewModel.password), fullname : \(viewModel.fullname), username : \(viewModel.username)")
    print("debug: ViewModel formIsValid : \(viewModel.formIsValid)")
    updateForm()//FormviewModel
  }
  
  
  func setUI(){
    contigureGradientLayer()
    
    view.addSubview(plusPhotoButton)
    plusPhotoButton.centerX(inView: view)
    plusPhotoButton.setDimensions(height: 140, width: 140)
    plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    
    let stack = UIStackView(arrangedSubviews: [emailTextfield, passwordTextfield, fullnameTextfield, usernameTextfield, SignUpButton])
    view.addSubview(stack)
    stack.axis = .vertical
    stack.spacing = 20
    stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    
    view.addSubview(alreadyHaveAccountButton)
    alreadyHaveAccountButton.centerX(inView: view)
    alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
  }
  //tf : textDidChange
  func configureNotificationObservers(){
    emailTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    passwordTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    fullnameTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    usernameTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
  }
  
}

extension RegistrationController: FormviewModel{
  func updateForm() {
    //뷰모델에서 가져오기.
    SignUpButton.backgroundColor = viewModel.buttonBackgroundColor
    SignUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
    SignUpButton.isEnabled = viewModel.formIsValid
  }
}
