//
//  UITextField+Extension.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 18/02/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

private let swizzling: (UITextField.Type) -> () = { textField in
    let originalSelector = #selector(setter: UITextField.placeholder)
    let swizzledSelector = #selector(UITextField.set(placeholder:))
    
    let originalMethod = class_getInstanceMethod(textField, originalSelector)
    let swizzledMethod = class_getInstanceMethod(textField, swizzledSelector)
    
    method_exchangeImplementations(originalMethod, swizzledMethod)
}

private struct RuntimeKey {
    static let PlaceholderColor = UnsafeRawPointer.init(bitPattern: "placeholderColor".hashValue)
}

extension UITextField {
    
    open override class func initialize() {
        guard self === UITextField.self else { return }
        swizzling(self)
    }
    
    var placeholderColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, RuntimeKey.PlaceholderColor) as? UIColor
        }
        
        set {
            objc_setAssociatedObject(self, RuntimeKey.PlaceholderColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if let placeholderLabel = value(forKey: "placeholderLabel") as? UILabel {
                placeholderLabel.textColor = newValue
            }
        }
    }
    
    func set(placeholder: String) {
        set(placeholder: placeholder)
        
        if let placeholderLabel = value(forKey: "placeholderLabel") as? UILabel {
            placeholderLabel.textColor = placeholderColor
        }
    }
}
