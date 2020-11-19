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
  //MARK:- Propertices
  
  
  //MARK:- Life clycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .systemBlue
    addSubview(profilImageView)
    profilImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
    profilImageView.setDimensions(height: 40, width: 40)
    profilImageView.layer.cornerRadius = 40/2
    
    addSubview(usernameButton)
    usernameButton.centerY(inView: profilImageView, leftAnchor: profilImageView.rightAnchor, paddingLeft: 8)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  
  //MARK:- Action
  
  @objc func didTapUsername(_ sender: UIButton){
    print("DEBUG: username did tap")
  }
}
