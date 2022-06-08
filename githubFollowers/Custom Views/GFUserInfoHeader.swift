//
//  GFUserInfoHeader.swift
//  githubFollowers
//
//  Created by Mahmoud on 02/06/2022.
//

import UIKit

class GFUserInfoHeader: UIViewController {
    
    
    let avaterImageView = GFAvaterImageView(frame: .zero)
    let userNamelabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSeconderyLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSeconderyLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user: User!
    
    init(user: User){
        super .init(nibName: nil, bundle: nil)
        self.user = user
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        layoutUI()
        configureUIElement()
        
    }
    
    func configureUIElement(){
        avaterImageView.downloadImage(from: user.avatarUrl)
        userNamelabel.text = user.login
        nameLabel.text = user.name ?? "no"
        locationLabel.text = user.location ?? "no location"
        bioLabel.text = user.bio ?? "no bio available"
        bioLabel.numberOfLines = 3
        
        locationImageView.image = UIImage(systemName: "mappin.and.ellipse")
        locationImageView.tintColor = .secondaryLabel
        
    }
    
    func addSubViews(){
        view.addSubview(avaterImageView)
        view.addSubview(userNamelabel)
        view.addSubview(nameLabel)
        view.addSubview(locationImageView)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
    }
    
    func layoutUI(){
        
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            avaterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avaterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            avaterImageView.widthAnchor.constraint(equalToConstant: 90),
            avaterImageView.heightAnchor.constraint(equalToConstant: 90),
            
            userNamelabel.topAnchor.constraint(equalTo: avaterImageView.topAnchor),
            userNamelabel.leadingAnchor.constraint(equalTo: avaterImageView.trailingAnchor, constant: textImagePadding),
            userNamelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            userNamelabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.centerYAnchor.constraint(equalTo: avaterImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avaterImageView.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationImageView.bottomAnchor.constraint(equalTo: avaterImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avaterImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.leadingAnchor, constant: 25),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.topAnchor.constraint(equalTo: avaterImageView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avaterImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)

        ])
        
    }

}
