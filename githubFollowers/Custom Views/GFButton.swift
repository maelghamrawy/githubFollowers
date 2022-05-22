//
//  GFButton.swift
//  githubFollowers
//
//  Created by Mahmoud on 20/05/2022.
//

import UIKit

class GFButton: UIButton {

    override init (frame: CGRect){
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init (backgrouncolor: UIColor, title: String){
        super.init(frame: .zero)
        self.backgroundColor = backgrouncolor
        self.setTitle(title, for: .normal)
        configure()
        
    }
    
    private func configure(){
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
