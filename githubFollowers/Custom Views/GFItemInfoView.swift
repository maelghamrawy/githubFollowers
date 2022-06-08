//
//  GFItemInfoView.swift
//  githubFollowers
//
//  Created by Mahmoud on 04/06/2022.
//

import UIKit


enum itemInfoType{
    case repos, gists, followers, following
}

class GFItemInfoView: UIView {
    
    let symbolImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let counterLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(symbolImageView)
        addSubview(titleLabel)
        addSubview(counterLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            counterLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            counterLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            counterLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            counterLabel.heightAnchor.constraint(equalToConstant: 18)
            
        
        ])
    }
    
    func set(itemInfoType: itemInfoType, withCount count: Int){
        switch itemInfoType {
        case .repos:
            symbolImageView.image = UIImage(systemName: "folder")
            titleLabel.text = "Public Repos"
        case .gists:
            symbolImageView.image = UIImage(systemName: "text.alignleft")
            titleLabel.text = "Public Gists"
        case .followers:
            symbolImageView.image = UIImage(systemName: "heart")
            titleLabel.text = "Followers"
        case .following:
            symbolImageView.image = UIImage(systemName: "person.2")
            titleLabel.text = "Following"
        }
        
        counterLabel.text = String(count)
        
    }

 

}
