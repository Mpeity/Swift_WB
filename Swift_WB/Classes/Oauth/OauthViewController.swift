//
//  OauthViewController.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/7/2.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD



class OauthViewController: UIViewController, WKUIDelegate, WKNavigationDelegate,WKScriptMessageHandler {
    
    // 进度条
    lazy var progressView = UIProgressView()

//    @IBOutlet weak var webView: WKWebView!
    
    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavibationBar()
        
        let config = WKWebViewConfiguration.init()
        webView = WKWebView(frame: self.view.frame, configuration: config)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        loadPage()
        
        
        progressView.frame = CGRect(x: 0, y: NAVIGATION_BAR_HEIGHT, width: FULL_SCREEN_WIDTH, height: 2)
        progressView.progressTintColor = UIColor.orange
        progressView.trackTintColor = UIColor.blue
        self.view.addSubview(progressView)
        
    }
    
    
    // JS 交互
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        Log(message)
        
    }
    
    // 监听网页加载进度
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        progressView.progress = Float(webView.estimatedProgress)
        
    }
    
    
    // 重定向
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {

        guard let url = webView.url else {
            return
        }
        
        let urlString = url.absoluteString
        
        guard urlString.contains("code=") else {
            return
        }
        
        // 取出code值
        let codeStr = urlString.components(separatedBy: "code=").last!
//        Log(codeStr)
        
        // 请求token
        loadAccessToken(code: codeStr)
        
        
    }
    
    // 页面开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }

    // 页面加载完成之后调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    
    }
    
    // 页面加载失败调用
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }


}


extension OauthViewController {
    private func setupNavibationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(leftBarButtonAction))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "填充", style: .plain, target: self, action: #selector(rightBarButtonAction))
        
        title = "登录页面"
    }
    
    
    private func loadPage() {
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(app_key)&redirect_uri=\(redirect_uri)&response_type=code"
        
        guard let url = URL(string: urlString) else { return }
        let requset = URLRequest(url: url)
        webView.load(requset)
        
    }
}

// MARK:- 事件监听
extension OauthViewController {
    // 关闭
    @objc func leftBarButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    // 填充按钮响应。
    @objc func rightBarButtonAction() {
        // 书写js代码
        let jsCode = "document.getElementById('userId').value='752946746@qq.com';document.getElementById('passwd').value='Mty752946746'"
        
        // 执行js代码
        webView.evaluateJavaScript(jsCode, completionHandler: nil)
    }
    
    
}

extension OauthViewController {
    // 获取token
    func loadAccessToken(code: String) {
        NetworkTools.shareInstance.loadAccessToken(code: code) { (result, error) in
            if error != nil {
                return
            }
            
            
            // 取到结果
            guard  let accountDic:[String : AnyObject] = result else { return }
            
            // 将字典转成模型对象
            let account = UserAccount(dic: accountDic)
            
//            Log(account)
            
            // 请求用户信息
            self.loadUserInfo(account: account)
        }
    }
    
    func loadUserInfo(account : UserAccount){
        guard let accessToken = account.access_token else {
            return
        }
        
        guard let uid = account.uid else {
            return
        }
        
        NetworkTools.shareInstance.loadUserInfo(access_token: accessToken, uid: uid) { (result, error) in
            if error != nil {
                return
            }
            
            
            guard let userInfoDic = result else {
                return
            }
                
            account.screen_name = userInfoDic["screen_name"] as? String
            account.avatar_large = userInfoDic["avatar_large"] as? String
            Log(account)
            
            // 将account对象保存
            // 获取沙盒路径
            var accountPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            
            accountPath = (accountPath as NSString).appendingPathComponent("account.plist")
            // 保存对象
            NSKeyedArchiver.archiveRootObject(account, toFile: accountPath)
            
            // 将account对象设置到单例对象中
            UserAccountViewModel.shareInstance.account = account
            
            // 退出当前控制器
            self.dismiss(animated: false) {
                UIApplication.shared.keyWindow?.rootViewController = WelComeViewController()
            }
        }
    }
    
    
    
}

