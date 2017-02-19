//
//  MMConvenientLoginButton.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 05/02/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

class MMConvenientLoginButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView?.frame.origin.y = 5
        imageView?.center.x = frame.width * 0.5
        
        titleLabel?.sizeToFit()
        titleLabel?.frame.origin.y = frame.height - (titleLabel?.frame.height)!
        titleLabel?.center.x = frame.width * 0.5
    }

}
