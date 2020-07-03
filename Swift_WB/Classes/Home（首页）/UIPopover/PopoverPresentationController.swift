//
//  PopoverPresentationController.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/7/1.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class PopoverPresentationController: UIPresentationController {
    
    private lazy var coverView: UIView = UIView()
    
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        presentedView?.frame = CGRect(x: 100, y: 80, width: 180, height: 200)
        
        setupCoverView()
    }
}


extension PopoverPresentationController {
    private func setupCoverView() {
        containerView?.insertSubview(coverView, at: 0)
        
        coverView.backgroundColor = UIColor(white: 0.8, alpha: 0.2)
        coverView.frame = containerView!.bounds
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(coverViewAction))
        coverView.addGestureRecognizer(tap)
    }
}

extension PopoverPresentationController {
    @objc private func coverViewAction() {
        presentingViewController.dismiss(animated: false, completion: nil)
    }
}
