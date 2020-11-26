//
//  ProfileCell.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/26.
//

import UIKit

class ProfileCell: UICollectionViewCell {
  
  
  //MARK:- properties
  private let postImageView: UIImageView = {
    let iv = UIImageView()
    iv.image = #imageLiteral(resourceName: "venom-7")
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    return iv
  }()
  
  //MARK:- life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .green
    
    addSubview(postImageView)
    postImageView.fillSuperview()//super
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
