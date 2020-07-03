//
//  UIButton-Extention.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/6/30.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

extension UIButton {
    // swift中类方法是以class开头的方法， 类似于OC中 + 号 开头的方法
    class func createButton(imageName: String, bgImageName: String) -> UIButton {
        let composeBtn = UIButton()
        
        composeBtn.setBackgroundImage(UIImage(named: bgImageName), for: .normal)
        composeBtn.setBackgroundImage(UIImage(named: bgImageName + "_highlighted"), for: .highlighted)
        composeBtn.setImage(UIImage(named: imageName), for: .normal)
        composeBtn.setImage(UIImage(named:imageName + "_highlighted"), for: .highlighted)
        composeBtn.sizeToFit()
        return composeBtn
    }
    
    // convenience 遍历，使用convenience修饰的构造函数叫做遍历构造函数
    // 遍历构造函数通常在对系统的类进行构造函数的扩充时使用
    
    // 特点：
    // 遍历构造函数通常都是写在extention里面
    // 在遍历构造函数中需要明确调用self.init
    // 遍历构造函数中需要加载convenience
    convenience init(imageName: String, bgImageName: String) {
        self.init()
        setBackgroundImage(UIImage(named: bgImageName), for: .normal)
        setBackgroundImage(UIImage(named: bgImageName + "_highlighted"), for: .highlighted)
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named:imageName + "_highlighted"), for: .highlighted)
        sizeToFit()
    }
}
