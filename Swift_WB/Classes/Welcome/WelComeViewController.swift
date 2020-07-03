//
//  WelComeViewController.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/7/2.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit
import SDWebImage

class WelComeViewController: UIViewController {

    @IBOutlet weak var iconImgViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var iconImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置头像
        let iconUrlString = UserAccountViewModel.shareInstance.account?.avatar_large
        guard let url = URL(string: iconUrlString ?? "") else { return }
        iconImgView.setImageWith(url, placeholderImage: UIImage(named: "avatar_default"))
        // 改变约束
        iconImgViewBottomConstraint.constant = FULL_SCREEN_HEIGHT - 250
        
        // 执行动画
        // Damping 阻力系数，阻力系数越大 弹动效果越不明显 0～
        // initialSpringVelocity 初始化速度
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5.0, options: [], animations: {
            self.view.layoutIfNeeded()
        }) { (_) in
            UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
