//
//  UIViewController+Ext.swift
//  githubFollowers
//
//  Created by Mahmoud on 21/05/2022.
//

import UIKit

extension UIViewController {
    
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String){
         
        
        DispatchQueue.main.async {
            let alret = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alret.modalTransitionStyle = .crossDissolve
            alret.modalPresentationStyle = .overFullScreen
            self.present(alret, animated: true)
        }
        
    }
    
    
    
    
}
