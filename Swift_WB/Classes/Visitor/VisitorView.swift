//
//  VisitorView.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/6/30.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    
    
    @IBOutlet weak var rotationView: UIImageView!
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    
    @IBOutlet weak var registedBtn: UIButton!
    
    @IBOutlet weak var logInBtn: UIButton!
    
    
    class func visitor() -> VisitorView {
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)?.first as! VisitorView
    }
    
    
    func setupVistorViewInfo(imageName: String, title: String) {
        rotationView.isHidden = true
        iconView.image = UIImage(named: imageName)
        tipLabel.text = title
    }
    
    
    func addRotationAnimation() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = Double.pi * 2
        rotationAnimation.repeatCount = MAXFLOAT
        rotationAnimation.duration = 5
        rotationAnimation.isRemovedOnCompletion = false
        
        rotationView.layer.add(rotationAnimation, forKey: nil)
        
    }

}
