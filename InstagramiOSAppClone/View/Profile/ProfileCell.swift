//
//  ProfileCell.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/26.
//

import UIKit

class ProfileCell: UICollectionViewCell {
  
  
  //MARK:- properties
  
  
  //MARK:- life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .green
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
