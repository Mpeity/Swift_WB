//
//  UIBarButtonItem-Extention.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/7/1.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imageName: String) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        self.init(customView: btn)
    }
}
