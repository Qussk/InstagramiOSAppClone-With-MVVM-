//
//  MainTapController.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/16.
//

import UIKit


class MainTapController : UITabBarController {
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewControllers()
  }
   
  
  
  //MARK:- Helper
  
  func configureViewControllers(){
    view.backgroundColor = .white

    
    let feed = templetNavigationController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectImage: #imageLiteral(resourceName: "home_selected") , rootViewController: FeedController())
    
    let search = templetNavigationController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectImage: #imageLiteral(resourceName: "search_selected") , rootViewController: SearchController())
    
    let imageSelector = templetNavigationController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"), selectImage: #imageLiteral(resourceName: "plus_unselected") , rootViewController: ImageSelectorController())
    
    let notifiCations = templetNavigationController(unselectedImage: #imageLiteral(resourceName: "like_unselected"), selectImage: #imageLiteral(resourceName: "like_selected") , rootViewController: NotifecationController())
    
    let progiles = templetNavigationController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectImage: #imageLiteral(resourceName: "profile_selected") , rootViewController: NotifecationController())
    
    viewControllers = [feed, search, imageSelector, notifiCations, progiles]
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
