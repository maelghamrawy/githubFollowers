//
//  GFIteminfoVC.swift
//  githubFollowers
//
//  Created by Mahmoud on 04/06/2022.
//

import UIKit

class GFIteminfoVC: UIViewController {
    
    let stackView = UIStackView()
    let itemViewOne = GFItemInfoView()
    let itewViewTwo = GFItemInfoView()
    let actionBT = GFButton()
    
    var user: User!
    weak var delegate: UserInfoVCDelegate!
    
    init(user: User){
        super.init(nibName: nil, bundle: nil)
        self.user = user
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundConfigure()
        layout()
        configureStackView()
        configureActionButton()

    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureStackView(){
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(itemViewOne)
        stackView.addArrangedSubview(itewViewTwo)
    }
    
    func backgroundConfigure(){
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 18
    }
    
    func configureActionButton(){
        actionBT.addTarget(self, action: #selector(actionButtonDidTapped), for: .touchUpInside)
    }
    @objc func actionButtonDidTapped() {}
    
    func layout(){
        view.addSubview(stackView)
        view.addSubview(actionBT)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            actionBT.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            actionBT.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionBT.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionBT.heightAnchor.constraint(equalToConstant: 44)
        
        ])
    }


}
