//
//  UserAccountViewModel.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/7/2.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class UserAccountViewModel {
    
    // 设计成单例
    static let shareInstance : UserAccountViewModel =  UserAccountViewModel()
    
    // 计算属性
    var accountPath :String {
        let accountPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return (accountPath as NSString).appendingPathComponent("account.plist")
    }
    
    // 属性
    var account : UserAccount?
    
    var isLogin : Bool {
        if account == nil {
            return false
        }
        
        guard let expiresDate = account?.expires_date else {
            return false
        }
        
        return expiresDate.compare(Date()) == ComparisonResult.orderedDescending
    }
    
    
    
    init() {
        // 从沙盒中读取归档的信息
        // 读取对象
        account = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? UserAccount
    }
    
    
    
//    func isLogin() -> Bool {
//        if account == nil {
//            return false
//        }
//
//        guard let expiresDate = account?.expires_date else {
//            return false
//        }
//
//        return expiresDate.compare(Date()) == ComparisonResult.orderedDescending
//    }
    
    
}
