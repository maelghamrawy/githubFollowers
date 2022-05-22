//
//  FollowerListVC.swift
//  githubFollowers
//
//  Created by Mahmoud on 21/05/2022.
//

import UIKit

class FollowerListVC: UIViewController {
    var username : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errrormessage in
            guard let followers = followers else {
                
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: errrormessage!, buttonTitle: "ok")
                return
            }
            
            print("follower Count = \(followers.count)")
            print(followers)
        }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    



}
