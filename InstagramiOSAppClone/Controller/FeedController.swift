//
//  FeedController.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/16.
//

import UIKit
import Firebase

private var reuseIdentifier = "Cell"

class FeedController : UICollectionViewController {

  
  //MARK:- life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    
  }
  //MARK:- Action
  
  @objc func handlerLogout(){
      do {
      try Auth.auth().signOut()
        let controller = LoginController()
        let nav = UINavigationController(rootViewController: LoginController())
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
      }catch {
        print("DEBUG: failed to sign out")
      }
  }
  
  //MARK:- Helpers
  
  func setUI(){
    collectionView.backgroundColor = .white
    
    collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(handlerLogout))
    navigationController?.title = "피드"
  }
}


//MARK:- UICollectionViewDataSource
extension FeedController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
    return cell
  }
  
}

//MARK:- UICollectionViewDelegateFlowLayout
extension FeedController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let width = view.frame.width
    var height = width + 8 + 40 + 8
    height += 50
    height += 60

    
    return CGSize(width: width, height: height)
  }
}

