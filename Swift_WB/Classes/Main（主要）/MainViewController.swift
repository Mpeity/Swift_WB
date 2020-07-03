//
//  MainViewController.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/6/29.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    lazy var imageNames = ["tabbar_home","tabbar_message_center","","tabbar_discover","tabbar_profile"]
    
//    private lazy var composeBtn: UIButton = UIButton()
//    private lazy var composeBtn: UIButton = UIButton.createButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    private lazy var composeBtn: UIButton = UIButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabbar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加中间第三个按钮
        setupComposeBtn()
        
        
//        // 获取json文件路径
//        guard let jsonPath = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil) else {
//            return
//        }
//        
//        // 读取json文件的内容
//        guard let jsonData = NSData(contentsOfFile: jsonPath) else {
//            return
//        }
//        
//        // 将data转为数组
//        guard let anyObject =  try? JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers)  else {
//            return
//        }
//        
//        guard let dicArr = anyObject as? [[String: AnyObject]] else {
//            return
//        }
//        
//        for dic in dicArr {
//            
//            guard let vcName = dic["vcName"] as? String else {
//                continue
//            }
//            
//            guard let title = dic["title"] as? String else {
//                continue
//            }
//            
//            guard let imageName = dic["imageName"] as? String else {
//                continue
//            }
//            
//            addChild(vcName, title: title, imageName: imageName)
//            
//        }
        
        

//        addChild(HomeViewController(), title: "首页", imageName: "tabbar_home")
//
//        addChild(MessageViewController(), title: "消息", imageName: "tabbar_message_center")
//
//        addChild(DiscoverViewController(), title: "广场", imageName: "tabbar_discover")
//
//        addChild(ProfileViewController(), title: "我", imageName: "tabbar_profile")
//
        
//        addChild("HomeViewController", title: "首页", imageName: "tabbar_home")
//
//        addChild("MessageViewController", title: "消息", imageName: "tabbar_message_center")
//
//        addChild("DiscoverViewController", title: "广场", imageName: "tabbar_discover")
//
//        addChild("ProfileViewController", title: "我", imageName: "tabbar_profile")
//
        
        
        // Do any additional setup after loading the view.
    }
    
    
    private func addChild(_ childControllerName: String, title: String, imageName: String) {
        
        // 根据字符串获取class
        
        // 获取命名空间
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            print("没有命名空间")
            return
        }
        
        
        // 将对应的AnyObject转成控制器的类型
        guard let childClass = NSClassFromString(nameSpace + "." + childControllerName) else {
            print("没有获取到对应的class")
            return
        }
        
        print("获取到对应的class")
        
        // 创建对应的控制器对象
        guard let childVCType = childClass as? UIViewController.Type else {
            print("没有获取到对应的控制器类型")
            return
        }
        
        
        let childController = childVCType.init()
        
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName+"_highlighted")
        childController.view.backgroundColor = UIColor.green

        let childNav = UINavigationController(rootViewController: childController)
        addChild(childNav)
    }
    
//    private func addChild(_ childController: UIViewController, title: String, imageName: String) {
//        childController.title = title
//        childController.tabBarItem.image = UIImage(named: imageName)
//        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
//        let childNav = UINavigationController(rootViewController: childController)
//        childController.view.backgroundColor = UIColor.green
//        addChild(childNav)
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainViewController {
    private func setupComposeBtn() {
        tabBar.addSubview(composeBtn)
        
//        composeBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: .normal)
//        composeBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .highlighted)
//        composeBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
//        composeBtn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        
//        composeBtn.sizeToFit()
        
        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
        
        // 监听按钮点击
        composeBtn.addTarget(self, action: #selector(composeBtnClick), for: .touchUpInside)
    }
    
    private func setupTabbar() {
        for i in 0..<tabBar.items!.count {
            let item = tabBar.items![i]
            if i == 2 {
                item.isEnabled = false
                continue
            }
            item.image = UIImage(named: imageNames[i])
            item.selectedImage = UIImage(named: imageNames[i]+"_highlighted")

        }
    }
}

// 事件监听
extension MainViewController {
    @objc private func composeBtnClick() {
        print("composeBtnClick")
    }
}

