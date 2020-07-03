//
//  BaseViewController.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/6/30.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {
    
//    var isLogin : Bool = UserAccountTool().isLogin
    
    var isLogin : Bool = UserAccountViewModel.shareInstance.isLogin
    
    lazy var visitorView: VisitorView = VisitorView.visitor()

    
    override func loadView() {
        
//        // 从沙盒中读取归档的信息
//        var accountPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//
//        accountPath = (accountPath as NSString).appendingPathComponent("account.plist")
//        // 读取对象
//        let account = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? UserAccount
        
//        if account != nil  {
//
//        }
        
//        // 可选绑定
//        if let newAccount = account {
//            // 取出过期日期判断
//            if let expiresDate = newAccount.expires_date {
//               isLogin = expiresDate.compare(NSDate() as Date) == ComparisonResult.orderedDescending
//            }
//
//        }
        
        
        
        isLogin ? super.loadView() : setupVisitorView()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        
        
        setupNavigationItem()
        
        visitorView.registedBtn.addTarget(self, action: #selector(leftBtnAction), for: .touchUpInside)
        visitorView.logInBtn.addTarget(self, action: #selector(rightBtnAction), for: .touchUpInside)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}

extension BaseViewController {
    private func setupVisitorView() {
        view = visitorView
    }
    
    private func setupNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(leftBtnAction))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(rightBtnAction))
    }
    
    
    
}

extension BaseViewController {
    // 注册
    @objc private func leftBtnAction() {
        
    }
    // 登录
    @objc private func rightBtnAction()  {
        let oauthVC = UINavigationController(rootViewController: OauthViewController())
        oauthVC.modalPresentationStyle = .fullScreen
        present(oauthVC, animated: true, completion: nil)
        
    }
}
