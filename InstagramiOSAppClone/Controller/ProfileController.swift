//
//  ProfileController.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/16.
//

import UIKit

private let cellidentifier = "ProfileCell"
private let headerIdentifier = "ProfileHeader"
class ProfileController: UICollectionViewController{
    
    override func viewDidLoad() {
      super.viewDidLoad()
      setUI()
      
    }
 
 //MARK:- Helpers
  func setUI(){
    collectionView.backgroundColor = .systemPink
    collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: cellidentifier)
    collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
   }
  }


//MARK:- CollectionViewDatasource
extension ProfileController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    9
  }
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellidentifier, for: indexPath) as! ProfileCell
    return cell
  }
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! ProfileHeader
    return header
  }
  
}


//MARK:- CollectionViewDalegate
extension ProfileController {
  
}
//MARK:- CollectionViewFlowLayout
extension ProfileController : UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (view.frame.width - 2) / 3
    return CGSize(width: width, height: width)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width , height: 240)
  }
}


