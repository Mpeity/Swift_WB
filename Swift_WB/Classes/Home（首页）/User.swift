//
//  User.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/7/3.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class User: NSObject {

    // 属性
    // 用户头像
    @objc var profile_image_url : String?
    // 用户昵称
    @objc var screen_name : String?
    
    // 用户认证类型
    @objc var verified_type : Int = -1 {
        didSet {
            switch verified_type {
            case 0:
                verifiedImage = UIImage(named: "avatar_vip")
            case 2,3,5:
                verifiedImage = UIImage(named: "avatar_enterprise_vip")
            case 220:
                verifiedImage = UIImage(named: "avatar_grassroot")

            default:
                verifiedImage = nil
            }
        }
    }
    
    // 用户的会员等级
    @objc var mbrank : Int = 0 {
        didSet {
            if mbrank > 0 , mbrank <= 6 {
                vipImage = UIImage(named: "common_icon_membership_level\(mbrank)")
            }
        }
    }
    
    // 处理用户认证类型
    @objc var verifiedImage : UIImage?
    // 处理用户的会员等级
    @objc var vipImage : UIImage?
    
    // 自定义构造函数
    init(dic : [String : AnyObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
