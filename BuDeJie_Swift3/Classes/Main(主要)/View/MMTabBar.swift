//
//  MMTabBar.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 16/01/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

class MMTabBar: UITabBar {
    
    lazy var plusButton: UIButton = {
        var button = UIButton(type: UIButtonType.custom)
        
        button.setBackgroundImage(UIImage(named: "tabBar_publish_icon"), for: UIControlState.normal)
        button.setBackgroundImage(UIImage(named: "tabBar_publish_click_icon"), for: UIControlState.highlighted)
        
        button.sizeToFit()
        self.addSubview(button)
        
        return button
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let count = (items?.count)! + 1
        let buttonWidth = frame.size.width / CGFloat(count)
        let buttonHeight = frame.size.height
        
        var buttonX: CGFloat = 0.0
        var i = 0
        for tabBarButton in subviews {
            if type(of: tabBarButton) == NSClassFromString("UITabBarButton") {
                if i == 2 {
                    i += 1
                }
                
                buttonX = CGFloat(i) * buttonWidth
                tabBarButton.frame = CGRect(x: buttonX, y: 0, width: buttonWidth, height: buttonHeight)
                
                i += 1
            }
        }
        
        plusButton.center = CGPoint(x: frame.size.width * 0.5, y: frame.size.height * 0.5)
    }

}
