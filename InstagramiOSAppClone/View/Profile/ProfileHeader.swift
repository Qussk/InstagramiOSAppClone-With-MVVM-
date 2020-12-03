//
//  ProfileHeader.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/26.
//

import UIKit
import SDWebImage

class ProfileHeader: UICollectionReusableView {
  
  //MARK:- properties
  
  var viewModel: ProfileHeaderViewModel? {
    didSet { configure() }
  }
  
  private let profileImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.backgroundColor = .lightGray
    return iv
  }()
  
  private let namelabel: UILabel = {
    let label = UILabel()
    label.contentMode = .center
    label.font = UIFont.boldSystemFont(ofSize: 14)
    return label
  }()
  
  private let editProfileFolloeButton: UIButton = {
    let button = UIButton()
    button.setTitle("Editing Profile", for: .normal)
    button.layer.cornerRadius = 3
    button.layer.borderWidth = 0.5
    button.layer.borderColor = UIColor.lightGray.cgColor
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(handleEditProfileFollowTapped), for: .touchUpInside)
    return button
  }()
  
  private lazy var postsLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = .center
    label.attributedText = attributedStatText(value: 5, label: "게시물")//attributedStatText(value: 5, label: "posts")
    return label
  }()
  private lazy var followersLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = .center
    label.attributedText = attributedStatText(value: 2, label: "팔로워")
    return label
  }()
  private lazy var followingLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = .center
    label.attributedText = attributedStatText(value: 1, label: "팔로잉")
    return label
  }()
  
  let gridButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
    return button
  }()
  let listButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "list"), for: .normal)
    button.tintColor = UIColor(white: 0, alpha: 0.2)
    return button
  }()
  let bookmarkButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
    button.tintColor = UIColor(white: 0, alpha: 0.2)
    return button
  }()
    
  //MARK:- Action
 @objc func handleEditProfileFollowTapped(){
  print("DEBUG: handleEditProfileFollowTapped")
  }
  
  //MARK:- Helpers
  func attributedStatText(value: Int, label: String) -> NSAttributedString {
    let attributedText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
    attributedText.append(NSAttributedString(string: label, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
    return attributedText
  }
  
  func configure(){
    guard let viewModel = viewModel else { return }
    print(viewModel.profileImageUrl)

    namelabel.text = viewModel.fullname
    profileImageView.sd_setImage(with: viewModel.profileImageUrl)
  }
  
  //MARK:- life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    
    addSubview(profileImageView)
    profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 12)
    profileImageView.setDimensions(height: 80, width: 80)
    profileImageView.layer.cornerRadius = 80 / 2
    
    addSubview(namelabel)
    namelabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
    addSubview(editProfileFolloeButton)
    editProfileFolloeButton.anchor(top: namelabel.bottomAnchor, left: leftAnchor,
                                   right: rightAnchor, paddingTop: 16,
                                   paddingLeft: 24, paddingRight: 24)
    
    let stack = UIStackView(arrangedSubviews: [postsLabel, followersLabel, followingLabel])
    stack.distribution = .fillEqually
    addSubview(stack)
    stack.centerY(inView: profileImageView)
    stack.anchor(left: profileImageView.rightAnchor, right: rightAnchor, paddingLeft: 12, paddingRight: 12, height: 50)
    
    let topDivider = UIView()
    topDivider.backgroundColor = .lightGray
    
    let bottomDivider = UIView()
    bottomDivider.backgroundColor = .lightGray
    
    let buttonStack = UIStackView(arrangedSubviews: [gridButton, listButton, bookmarkButton])
    buttonStack.distribution = .fillEqually
    addSubview(buttonStack)
    addSubview(topDivider)
    addSubview(bottomDivider)
    
    buttonStack.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 50)
    topDivider.anchor(top: buttonStack.topAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
    bottomDivider.anchor(top: buttonStack.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
