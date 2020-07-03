//
//  TitleButton.swift
//  Swift_WB
//
//  Created by 马滕亚 on 2020/7/1.
//  Copyright © 2020 M.Y.A. All rights reserved.
//

import UIKit

class TitleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(named: "navigationbar_arrow_up"), for: .normal)
        setImage(UIImage(named: "navigationbar_arrow_down"), for: .selected)
        setTitle("mmmm", for: .normal)
        setTitleColor(UIColor.black, for: .normal)
        sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel!.frame.origin.x = 0
        imageView!.frame.origin.x = titleLabel!.frame.size.width + 8
    }
    

}
