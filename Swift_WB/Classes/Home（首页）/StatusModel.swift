//
//  StatusModel.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/7/3.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class StatusModel: NSObject {
    // 属性
    // 微博创建时间
    @objc var create_at : String?
    // 这一段代码 统一交给StatusViewModel 来处理
//        {
//        didSet {
//            guard let create_at = create_at else {
//                return
//            }
//
//            createAtText = Date.createDateString(createAtStr: create_at)
//        }
//    }
    // 微博来源
    @objc var source : String?
    // 这一段代码 统一交给StatusViewModel 来处理
//        {
//        didSet {
//            guard let source = source, source != "" else {
//                return
//            }
//
////            "source": <a href="http://app.weibo.com/t/feed/4iDt6Q" rel="nofollow">微博云剪</a>, "hot_weibo_tags": <__NSArray0 0x7fff8062d430>
//
//            // 对来源字符串进行处理
//            let startIndex = (source as NSString).range(of: ">").location + 1
//            let lenth = (source as NSString).range(of: "<").location - startIndex
//
//            // 截取字符串
//            sourceText = (source as NSString).substring(with: NSRange(location: startIndex, length: lenth))
//
//        }
//    }
    @objc var text : String? // 微博正文
    @objc var mid : Int = 0 // 微博id
    
    // 用户信息
    @objc var user : User?
    // 来源
//    @objc var sourceText : String?
//    // 时间
//    @objc var createAtText : String?
    
    // 自定义构造函数
    init(dic : [String : AnyObject]) {
        super.init()
        setValuesForKeys(dic)
        
        if let userDic = dic["user"] as? [String : AnyObject] {
            user = User(dic: userDic)
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    

}
