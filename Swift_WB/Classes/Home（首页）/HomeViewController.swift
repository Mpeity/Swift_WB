//
//  HomeViewController.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/6/29.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    
    private lazy var titleBtn: TitleButton = TitleButton()
    
    
    private lazy var statusesArr : [StatusModel] = [StatusModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        visitorView.addRotationAnimation()
        
        if !isLogin {
            return
        }
        
        setNavigationBar()
        
        loadHomeStatuses()
    }



}

// MARK: - Table view data source

extension HomeViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return statusesArr.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCellId")!
        let status = statusesArr[indexPath.row]
        cell.textLabel?.text = status.text
        return cell
        
    }
}

extension HomeViewController {
    private func setNavigationBar() {
        // 设置Item
//        let letfBtn = UIButton()
//        letfBtn.setImage(UIImage(named: "navigationbar_friendattention_highlighted"), for: .normal)
//        letfBtn.setImage(UIImage(named: "navigationbar_friendattention"), for: .highlighted)
//
//        letfBtn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
        
        
//        let rightBtn = UIButton()
//        rightBtn.setImage(UIImage(named: "navigationbar_pop_highlighted"), for: .normal)
//        rightBtn.setImage(UIImage(named: "navigationbar_pop"), for: .highlighted)
//
//        rightBtn.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
        
//        titleBtn.setImage(UIImage(named: "navigationbar_arrow_up"), for: .normal)
//        titleBtn.setImage(UIImage(named: "navigationbar_arrow_down"), for: .selected)
//        titleBtn.setTitleColor(UIColor.black, for: .normal)
        
        titleBtn.setTitle("mmmm", for: .normal)
        titleBtn.addTarget(self, action: #selector(titleBtnAction), for: .touchUpInside)
        navigationItem.titleView = titleBtn
        
    }
    
    

}

// MARK - 事件监听
extension HomeViewController {
    @objc func titleBtnAction(titleBtn: TitleButton) {
        titleBtn.isSelected = !titleBtn.isSelected
        
        let popoverVC = PopoverViewController()
        popoverVC.modalPresentationStyle = .custom
        popoverVC.transitioningDelegate = self
        present(popoverVC, animated: true, completion: nil)
        
    }
}


extension HomeViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    
        return PopoverPresentationController.init(presentedViewController: presented, presenting: presenting)
        
    }
}

// MARK:- 首页请求数据
extension HomeViewController {
    func loadHomeStatuses() {
        NetworkTools.shareInstance.loadHomeStatus { (result, error) in
            if error != nil {
                return
            }
            guard let resultArr = result else {
                return
            }
            
            // 遍历数据
            for dic in resultArr {
                let status = StatusModel(dic: dic)
                self.statusesArr.append(status)
            }
            
            
            // 刷新列表
            self.tableView.reloadData()
        }
        
        
    }
}







