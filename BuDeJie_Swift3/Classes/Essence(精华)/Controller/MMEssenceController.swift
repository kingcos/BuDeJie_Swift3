//
//  MMEssenceController.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 10/01/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

class MMEssenceController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        setupNavBar()
    }
    
    func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            normal: "nav_item_game_icon",
            highlighted: "nav_item_game_click_icon",
            addTarget: self, action: #selector(leftButtonClick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            normal: "navigationButtonRandom",
            highlighted: "navigationButtonRandomClick",
            addTarget: self, action: #selector(rightButtonClick))
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle"))
    }
    
    func leftButtonClick() {
        print(#function)
    }
    
    func rightButtonClick() {
        print(#function)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
