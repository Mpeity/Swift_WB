//
//  StatusViewModel.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/7/3.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class StatusViewModel: NSObject {
    // 定义属性
    //
    var statusModel : StatusModel?
    // 处理来源
    var sourceText : String?
    // 处理创建时间
    var createAtText : String?
    
    // 处理用户认证类型
    @objc var verifiedImage : UIImage?
    // 处理用户的会员等级
    @objc var vipImage : UIImage?
    
    
    init(statusModel : StatusModel) {
        self.statusModel = statusModel
        
        if let source = statusModel.source , source != "" {
            // 对来源字符串进行处理
            let startIndex = (source as NSString).range(of: ">").location + 1
            let lenth = (source as NSString).range(of: "<").location - startIndex
            
            // 截取字符串
            sourceText = (source as NSString).substring(with: NSRange(location: startIndex, length: lenth))
            
            // 处理时间
            if let createAt = statusModel.create_at {
                createAtText = Date.createDateString(createAtStr: createAt)
            }
            
            // 处理认证
            let vertifiedType = statusModel.user?.verified_type ?? -1
            switch vertifiedType {
            case 0:
                verifiedImage = UIImage(named: "avatar_vip")
            case 2,3,5:
                verifiedImage = UIImage(named: "avatar_enterprise_vip")
            case 220:
                verifiedImage = UIImage(named: "avatar_grassroot")

            default:
                verifiedImage = nil
            }
            
            // 处理会员
            let mbrank = statusModel.user?.mbrank ?? 0
            if mbrank > 0 && mbrank <= 6 {
                vipImage = UIImage(named: "common_icon_membership_level\(mbrank)")
            }
        }
    }


}
