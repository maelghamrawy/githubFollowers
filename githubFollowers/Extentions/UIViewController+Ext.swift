//
//  UIViewController+Ext.swift
//  githubFollowers
//
//  Created by Mahmoud on 21/05/2022.
//

import UIKit

fileprivate var containerView : UIView!


extension UIViewController {

    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String){
         
        
        DispatchQueue.main.async {
            let alret = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alret.modalTransitionStyle = .crossDissolve
            alret.modalPresentationStyle = .overFullScreen
            self.present(alret, animated: true)
        }
    }
    
    func showLoadingView(){
        
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.7
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView(){
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    func showEmptyStateView(with message: String, in view: UIView){
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }

}
