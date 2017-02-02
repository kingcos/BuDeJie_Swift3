//
//  UIImage+Extension.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 15/01/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(normal normalImageName: String, highlighted highlighedImageName: String, addTarget target: Any?, action: Selector) {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: normalImageName), for: .normal)
        button.setImage(UIImage(named: highlighedImageName), for: .highlighted)
        button.sizeToFit()
        button.addTarget(target, action: action, for: .touchUpInside)
        
        let view = UIView(frame: button.frame)
        view.addSubview(button)
        
        self.init(customView: view)
    }
    
    convenience init(normal normalImageName: String, selected selectedImageName: String, addTarget target: Any?, action: Selector) {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: normalImageName), for: .normal)
        button.setImage(UIImage(named: selectedImageName), for: .selected)
        button.sizeToFit()
        button.addTarget(target, action: action, for: .touchUpInside)
        
        let view = UIView(frame: button.frame)
        view.addSubview(button)
        
        self.init(customView: view)
    }
    
    convenience init(normal normalImageName: String, highlighted highlighedImageName: String, addTarget target: Any?, action: Selector, title: String) {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setImage(UIImage(named: normalImageName), for: .normal)
        button.setImage(UIImage(named: highlighedImageName), for: .highlighted)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.red, for: .highlighted)
        button.sizeToFit()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.addTarget(target, action: action, for: .touchUpInside)
        
        let view = UIView(frame: button.frame)
        view.addSubview(button)
        
        self.init(customView: view)
    }
}
