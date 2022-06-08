//
//  GFSeconderyLabel.swift
//  githubFollowers
//
//  Created by Mahmoud on 02/06/2022.
//

import UIKit

class GFSeconderyLabel: UILabel {
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        configure()
    }
    
   private func configure(){
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
        
    }

}
