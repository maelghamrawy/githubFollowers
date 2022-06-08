//
//  FavoriteCell.swift
//  githubFollowers
//
//  Created by Mahmoud on 06/06/2022.
//

import UIKit

class FavoriteCell: UITableViewCell {

    static let reuseID         = "favoriteCell"
    let avaterImageview = GFAvaterImageView(frame: .zero)
    let titleLabel      = GFTitleLabel(textAlignment: .left, fontSize: 26)
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()

       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(favorite: Follower) {
        titleLabel.text = favorite.login
        avaterImageview.downloadImage(from: favorite.avatarUrl)
 
    }
    
    
    private func configure() {
        
        addSubview(avaterImageview)
        addSubview(titleLabel)
        
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 12
        NSLayoutConstraint.activate([
        
            avaterImageview.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avaterImageview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avaterImageview.heightAnchor.constraint(equalToConstant: 60),
            avaterImageview.widthAnchor.constraint(equalToConstant: 60),
            
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: avaterImageview.trailingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
        
        
        
        ])
    }
    
}
