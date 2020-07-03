//
//  Common.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/7/2.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import Foundation
import UIKit


// MARK:- 微博授权常量


//App Key：135761428
//App Secret：07834af7d1a2d0459f4c2b63bfcf5f4f
let app_key = "135761428"
let app_secret = "07834af7d1a2d0459f4c2b63bfcf5f4f"
let redirect_uri = "http://www.520it.com"


let FULL_SCREEN_WIDTH = UIScreen.main.bounds.size.width
let FULL_SCREEN_HEIGHT = UIScreen.main.bounds.size.height


//iPHONE_X 判断
let IS_iPHONE_X = UIDevice.current.isX()
// 状态栏高度
let STATUS_BAR_HEIGHT:CGFloat = (IS_iPHONE_X ? 44.0 : 20.0)
// 导航栏高度
let NAVIGATION_BAR_HEIGHT:CGFloat = (IS_iPHONE_X ? 88.0 : 64.0)
// tabBar高度
let TAB_BAR_HEIGHT:CGFloat = (IS_iPHONE_X ? (49.0+34.0) : 49.0)
// home indicator
let HOME_INDICATOR_HEIGHT:CGFloat = (IS_iPHONE_X ? 34.0 : 0.0)


extension UIDevice {
    public func isX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        
        return false
    }
}

func Log<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("\(fileName):(\(lineNum))-\(message)")
    
    #endif
}




