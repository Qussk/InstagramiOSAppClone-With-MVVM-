//
//  FeedCell.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/19.
//

import UIKit

class FeedCell : UICollectionViewCell {
  
  let profilImageView : UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.isUserInteractionEnabled = true
    iv.image = #imageLiteral(resourceName: "venom-7")
    return iv
  }()
  
  private lazy var usernameButton : UIButton = {
    let button = UIButton(type: .system)
    button.setTitleColor(.black, for: .normal)
    button.setTitle("vetman", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    button.addTarget(self, action: #selector(didTapUsername(_ :)), for: .touchUpInside)
    return button
  }()
  
  private let postImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.isUserInteractionEnabled = true
    iv.image = #imageLiteral(resourceName: "venom-7")
return iv
  }()
  
  private lazy var likeButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "like_unselected"), for: .normal)
    button.tintColor = .black
    return button
  }()
  
  private lazy var commentButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
    button.tintColor = .black
    return button
  }()
  
  private lazy var shareButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "send2"), for: .normal)
    button.tintColor = .black
    return button
  }()
  
  private let likeLabel: UILabel = {
    let label = UILabel()
    label.text = "1 like"
    label.font = UIFont.boldSystemFont(ofSize: 13)
    return label
  }()
  
  private let captionLabel: UILabel = {
    let label = UILabel()
    label.text = "test label"
    label.font = UIFont.boldSystemFont(ofSize: 14)
    return label
  }()
  
  private let posttimeLabel: UILabel = {
    let label = UILabel()
    label.text = "2 day ago"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = .lightGray
    return label
  }()
    
  
  
  //MARK:- Propertices
  
  
  //MARK:- Life clycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(profilImageView)
    profilImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
    profilImageView.setDimensions(height: 40, width: 40)
    profilImageView.layer.cornerRadius = 40/2
    
    addSubview(usernameButton)
    usernameButton.centerY(inView: profilImageView, leftAnchor: profilImageView.rightAnchor, paddingLeft: 8)
    
    
    addSubview(postImageView)
    postImageView.anchor(top: profilImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
    postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
    
    configuerActionButton()
    
    addSubview(likeLabel)
    likeLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingTop: -4, paddingLeft: 8)
    
    addSubview(captionLabel)
    captionLabel.anchor(top: likeLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
    
    addSubview(posttimeLabel)
    posttimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
 
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  
  //MARK:- Action
  
  @objc func didTapUsername(_ sender: UIButton){
    print("DEBUG: username did tap")
  }
  
  func configuerActionButton(){
    let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    
    addSubview(stackView)
    stackView.anchor(top: postImageView.bottomAnchor, width: 120, height: 50)
  }
}
