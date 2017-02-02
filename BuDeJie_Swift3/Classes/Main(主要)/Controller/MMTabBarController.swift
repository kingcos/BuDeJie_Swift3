//
//  MMTabBarController.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 10/01/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

class MMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAllChildControllers()
        setupAllTitleButton()
        setupTabBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override class func initialize() {
        let items = UITabBarItem.appearance(whenContainedInInstancesOf: [MMTabBarController.self])
        var attrsSelected = [String : Any]()
        attrsSelected[NSForegroundColorAttributeName] = UIColor.black
        items.setTitleTextAttributes(attrsSelected, for: UIControlState.selected)
        
        var attrsNormal = [String : Any]()
        attrsNormal[NSFontAttributeName] = UIFont.systemFont(ofSize: 13)
        items.setTitleTextAttributes(attrsNormal, for: UIControlState.normal)
    }
    
    func setupAllChildControllers() {
        // 添加子控制器
        let essenceVC = MMEssenceController()
        let navController0 = MMNavigatioController(rootViewController: essenceVC)
        self.addChildViewController(navController0)
        
        // 添加子控制器
        let newVC = MMNewController()
        let navController1 = MMNavigatioController(rootViewController: newVC)
        self.addChildViewController(navController1)
        
        // 添加子控制器
        let friendTrendVC = MMFriendTrendController()
        let navController3 = MMNavigatioController(rootViewController: friendTrendVC)
        self.addChildViewController(navController3)
        
        // 添加子控制器
        let meVC = MMMeController()
        let navController4 = MMNavigatioController(rootViewController: meVC)
        self.addChildViewController(navController4)
    }
    
    func setupAllTitleButton() {
        
        let navController0 = childViewControllers[0]
        navController0.tabBarItem.title = "精华"
        navController0.tabBarItem.image = UIImage(named: "tabBar_essence_icon")
        navController0.tabBarItem.selectedImage = UIImage(named: "tabBar_essence_click_icon")?.withRenderingMode(.alwaysOriginal)
        
        let navController1 = childViewControllers[1]
        navController1.tabBarItem.title = "新帖"
        navController1.tabBarItem.image = UIImage(named: "tabBar_new_icon")
        navController1.tabBarItem.selectedImage = UIImage(named: "tabBar_new_click_icon")?.withRenderingMode(.alwaysOriginal)
        
        let navController2 = childViewControllers[2]
        navController2.tabBarItem.title = "关注"
        navController2.tabBarItem.image = UIImage(named: "tabBar_friendTrends_icon")
        navController2.tabBarItem.selectedImage = UIImage(named: "tabBar_friendTrends_click_icon")?.withRenderingMode(.alwaysOriginal)
        
        let navController3 = childViewControllers[3]
        navController3.tabBarItem.title = "我"
        navController3.tabBarItem.image = UIImage(named: "tabBar_me_icon")
        navController3.tabBarItem.selectedImage = UIImage(named: "tabBar_me_click_icon")?.withRenderingMode(.alwaysOriginal)

    }
    
    func setupTabBar() {
        let tabBar = MMTabBar()
        setValue(tabBar, forKeyPath: "tabBar")
    }
}
