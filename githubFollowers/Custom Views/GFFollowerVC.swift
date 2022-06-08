//
//  GFFollowerVC.swift
//  githubFollowers
//
//  Created by Mahmoud on 04/06/2022.
//

import UIKit

class GFFollowerItemVC: GFIteminfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
  
    func configure(){
        itemViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itewViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionBT.set(backgroundColor: .systemBlue, title: "Github Followers")
    }
    
    override func actionButtonDidTapped() {
        
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No Followers", message: "This user has no followers", buttonTitle: "ok")
            return
        }
        
        delegate.didTapGetFollowers(for: user)
       
    }
    
    
}
