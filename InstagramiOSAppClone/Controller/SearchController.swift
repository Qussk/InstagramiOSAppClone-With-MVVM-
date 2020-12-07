//
//  SearchController.swift
//  InstagramiOSAppClone
//
//  Created by Qussk_MAC on 2020/11/16.
//

import UIKit


private let reuseIdentifier = "UserCell"
class SearchController : UITableViewController{
    
  //MARK: -propeties
  
  //MARK: -Lifecycle
  
    override func viewDidLoad() {
      super.viewDidLoad()
      
      setUI()
      
    }
  
  
  //MARK: - Helpers
  func setUI(){
    tableView.rowHeight = 64
    tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)

    view.backgroundColor = .white
  }

  
  }
//MARK: -UITableviewDataSource

extension SearchController{
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
  return cell
  }
}
