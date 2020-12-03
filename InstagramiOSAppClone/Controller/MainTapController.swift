//
//  MainTapController.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/16.
//

import UIKit
import Firebase
import RxSwift

class MainTapController : UITabBarController {
  
  private var user: User?{
    didSet{
      guard let user = user else {return}
      configureViewControllers(withUser: user)
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    checkIfUserISLoggedIn()
    fetchUser()
  }
   
  //MARK:-API
  func fetchUser(){
    UserService.fetchUser { user in
      self.user = user
      self.navigationItem.title = user.username
    }
  }
  
  func checkIfUserISLoggedIn(){
    if Auth.auth().currentUser == nil {
      DispatchQueue.main.async {
        let controller = LoginController()
        controller.delegate = self
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
        print("ssss")
      }
    }
  }
  
  
  //MARK:- Helper
  
  func configureViewControllers(withUser user: User){
    view.backgroundColor = .white
    
    //collectionviewController
    let layout = UICollectionViewFlowLayout()
    let feed = templetNavigationController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectImage: #imageLiteral(resourceName: "home_selected") , rootViewController: FeedController(collectionViewLayout: layout))
    
    let search = templetNavigationController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectImage: #imageLiteral(resourceName: "search_selected") , rootViewController: SearchController())
    
    let imageSelector = templetNavigationController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"), selectImage: #imageLiteral(resourceName: "plus_unselected") , rootViewController: ImageSelectorController())
    
    let notifiCations = templetNavigationController(unselectedImage: #imageLiteral(resourceName: "like_unselected"), selectImage: #imageLiteral(resourceName: "like_selected") , rootViewController: NotifecationController())
    
    //collectionviewController
  //  let profileLayout = UICollectionViewFlowLayout()
    let profileController = ProfileController(user: user)
    let profiles = templetNavigationController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectImage: #imageLiteral(resourceName: "profile_selected") , rootViewController: profileController)
    
    viewControllers = [feed, search, imageSelector, notifiCations, profiles]
    tabBar.tintColor = .black
  }
  
  func templetNavigationController(unselectedImage: UIImage, selectImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
    let nav = UINavigationController(rootViewController: rootViewController)
    nav.tabBarItem.image = unselectedImage
    nav.tabBarItem.selectedImage = selectImage
    nav.navigationBar.tintColor = .black
    return nav
  }
}

extension MainTapController: AuthenticationDelegate{
  func AuthenticationDidComplete() {
    fetchUser()
    self.dismiss(animated: true, completion: nil)
  }
}

