//
//  SceneDelegate.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/6/29.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var defaultViewController : UIViewController? {
        let isLogin = UserAccountViewModel.shareInstance.isLogin
        return isLogin ? WelComeViewController() : UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() 
        
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        

//        UIWindowScene *ws = (UIWindowScene *)scene;
//        self.window = [[UIWindow alloc] initWithWindowScene:ws];
//        self.window.frame = ws.coordinateSpace.bounds;
//        self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[OneViewController alloc] init]];
//        [self.window makeKeyAndVisible];
        
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        // 设置导航栏和工具栏的外观
        // 因为外观一旦设置全局有效，所以应该在程序一进来就设置
        UINavigationBar.appearance().tintColor = UIColor.orange
        UITabBar.appearance().tintColor = UIColor.orange
        
        self.window = UIWindow(windowScene: scene as! UIWindowScene)
        self.window?.frame = (scene as! UIWindowScene).coordinateSpace.bounds
        self.window?.backgroundColor = UIColor.green
        self.window?.rootViewController = defaultViewController
        self.window?.makeKeyAndVisible()
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

