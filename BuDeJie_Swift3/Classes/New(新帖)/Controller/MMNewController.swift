//
//  MMNewController.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 10/01/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

class MMNewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        setupNavBar()
    }
    
    func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            normal: "MainTagSubIcon",
            highlighted: "MainTagSubIconClick",
            addTarget: self, action: #selector(subscriberButtonClick))
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle"))
    }
    
    func subscriberButtonClick() {
        let subscriberTableVC = MMSubscriberTableViewController()
        navigationController?.pushViewController(subscriberTableVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
