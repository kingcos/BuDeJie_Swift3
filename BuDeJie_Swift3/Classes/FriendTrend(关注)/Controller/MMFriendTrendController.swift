//
//  MMFriendTrendController.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 10/01/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

class MMFriendTrendController: UIViewController {

    @IBAction func clickLoginButton(_ sender: Any) {
        let loginVC = MMLoginViewController()
        present(loginVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
    }
    
    func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            normal: "friendsRecommentIcon",
            highlighted: "friendsRecommentIcon-click",
            addTarget: self, action: #selector(leftButtonClick))
        
        navigationItem.title = "我的关注"
    }
    
    func leftButtonClick() {
        print(#function)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
