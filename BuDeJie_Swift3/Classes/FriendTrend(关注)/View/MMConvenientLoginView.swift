//
//  MMConvenientLoginView.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 04/02/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

class MMConvenientLoginView: UIView {

    class func initMMConvenientLoginView() -> UIView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.first as! UIView
    }

}
