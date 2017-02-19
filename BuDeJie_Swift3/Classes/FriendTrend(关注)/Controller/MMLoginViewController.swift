//
//  MMLoginViewController.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 04/02/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

class MMLoginViewController: UIViewController {

    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomView: UIView!
    
    let loginView = MMLoginView.initLoginView()
    let registerView = MMLoginView.initRegisterView()
    let convenientLoginView = MMConvenientLoginView.initMMConvenientLoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        middleView.addSubview(loginView)
        middleView.addSubview(registerView)
        bottomView.addSubview(convenientLoginView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        loginView.frame = CGRect(x: 0, y: 0, width: middleView.frame.width * 0.5, height: middleView.frame.height)
        registerView.frame = CGRect(x: middleView.frame.width * 0.5, y: 0, width: middleView.frame.width * 0.5, height: middleView.frame.height) 
        convenientLoginView.frame = bottomView.bounds
    }
    
    @IBAction func clickCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickRegisterButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            leadingConstraint.constant = -middleView.frame.width * 0.5
        } else {
            leadingConstraint.constant = 0
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    

    

}
