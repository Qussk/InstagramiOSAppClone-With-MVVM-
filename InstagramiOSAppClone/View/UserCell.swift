//
//  UserCell.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/12/07.
//

import UIKit

class UserCell: UITableViewCell{
  
  //MARK: -properties
  let profileImageView : UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.backgroundColor = .lightGray
    iv.image = #imageLiteral(resourceName: "venom-7")
    return iv
  }()
  
  let usernameLabel: UILabel = {
  let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.text = "venom"
    return label
  }()
  let fullnameLabel: UILabel = {
  let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.text = "Eddie Brock"
    label.textColor = .lightGray
    return label
  }()

  
  //MARK: - Life cycle

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    addSubview(profileImageView)
    profileImageView.setDimensions(height: 48, width: 48)
    profileImageView.layer.cornerRadius = 48/2
    profileImageView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
    
let stack = UIStackView(arrangedSubviews: [usernameLabel, fullnameLabel])
    stack.axis = .vertical
    stack.spacing = 4
    stack.alignment = .leading
    
    addSubview(stack)
    stack.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

