//
//  UserInfoVC.swift
//  githubFollowers
//
//  Created by Mahmoud on 02/06/2022.
//

import UIKit
import SafariServices

protocol UserInfoVCDelegate: class {
    func didTapGitHubProfile(for user: User)
    func didTapGetFollowers(for user: User)
}

class UserInfoVC: UIViewController {
    var username: String!
    weak var delegate: followerlistVCDelegate! 
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dataLabel = GFBodyLabel(textAlignment: .center)

    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureViewController()
        layoutUI()
        getInfoUser()
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        let addBarBT = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = addBarBT
    }
    
    func getInfoUser(){
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                
                DispatchQueue.main.async {
                    self.configureUiElements(with: user)
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "somrthing went wrong", message: error.rawValue, buttonTitle: "ok")
            }
        }
    }
    
    func configureUiElements(with user: User) {
        
        let repoItemVC = GFRepoItemVC(user: user)
        repoItemVC.delegate =  self
        
        let followerItemVC = GFFollowerItemVC(user: user)
        followerItemVC.delegate = self
        
        self.add(chidVC: GFUserInfoHeader(user: user), to: self.headerView)
        self.add(chidVC: repoItemVC, to: self.itemViewOne)
        self.add(chidVC: followerItemVC, to: self.itemViewTwo)
        self.dataLabel.text = "GitHub since \(user.createdAt.displayFormat())"
        
    }
    
    func layoutUI(){
        view.addSubview(headerView)
        view.addSubview(itemViewOne)
        view.addSubview(itemViewTwo)
        view.addSubview(dataLabel)
      
    
        headerView.translatesAutoresizingMaskIntoConstraints  = false
        itemViewOne.translatesAutoresizingMaskIntoConstraints = false
        itemViewTwo.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.translatesAutoresizingMaskIntoConstraints   = false
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 25),
            itemViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            itemViewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            itemViewOne.heightAnchor.constraint(equalToConstant: 140),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: 25),
            itemViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            itemViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            itemViewTwo.heightAnchor.constraint(equalToConstant: 140),
        
           dataLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor,constant: 20 ),
           dataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           dataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
           dataLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    func add(chidVC: UIViewController, to containerView: UIView){
        addChild(chidVC)
        containerView.addSubview(chidVC.view)
        chidVC.view.frame = containerView.bounds
        chidVC.didMove(toParent: self)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
}

extension UserInfoVC: UserInfoVCDelegate {
    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "invalid URL", message: "the url attached to this user is invalid", buttonTitle: "ok")
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
        
    }
    
    func didTapGetFollowers(for user: User) {
        delegate.didRequestFollowers(for: user.login)
        dismiss(animated: true)
    }
    

    
    
    
}
