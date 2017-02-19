//
//  MMLoginTextField.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 17/02/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

class MMLoginTextField: UITextField {

    override func awakeFromNib() {
        tintColor = UIColor.white
        
        addTarget(self, action: #selector(beginEdit), for: .editingDidBegin)
        addTarget(self, action: #selector(endEdit), for: .editingDidEnd)
        
        endEdit()
    }
    
    func beginEdit() {
//        var attrs = [String : Any]()
//        attrs[NSForegroundColorAttributeName] = UIColor.white
//        attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: attrs)
        placeholderColor = UIColor.white
    }
    
    func endEdit() {
//        var attrs = [String : Any]()
//        attrs[NSForegroundColorAttributeName] = UIColor.lightGray
//        attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: attrs)
        placeholderColor = UIColor.lightGray
    }

}
