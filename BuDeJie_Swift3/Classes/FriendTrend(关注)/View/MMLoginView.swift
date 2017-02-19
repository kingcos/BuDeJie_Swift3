//
//  MMLoginView.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 04/02/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

class MMLoginView: UIView {

    @IBOutlet weak var loginButton: UIButton!
    
    class func initLoginView() -> UIView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.first as! UIView
    }
    
    class func initRegisterView() -> UIView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as! UIView
    }
    
    override func awakeFromNib() {
        guard let loginButtonBackground = loginButton.currentBackgroundImage else {
            return
        }

        loginButton.setBackgroundImage(
            loginButtonBackground.stretchableImage(
                withLeftCapWidth: Int(loginButtonBackground.size.width) / 2,
                topCapHeight: Int(loginButtonBackground.size.height) / 2 ),
            for: .normal)
    }
}
