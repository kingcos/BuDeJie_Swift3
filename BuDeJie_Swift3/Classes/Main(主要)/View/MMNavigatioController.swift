//
//  MMNavigatioController.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 17/01/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

class MMNavigatioController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let panGestureRecognizer = UIPanGestureRecognizer(target: interactivePopGestureRecognizer?.delegate, action: Selector("handleNavigationTransition:"))
        view.addGestureRecognizer(panGestureRecognizer)
        panGestureRecognizer.delegate = self
        
        interactivePopGestureRecognizer?.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override class func initialize() {
        let navBar = UINavigationBar.appearance(whenContainedInInstancesOf: [MMNavigatioController.self])
        var attrs = [String : Any]()
        attrs[NSFontAttributeName] = UIFont.boldSystemFont(ofSize: 20)
        navBar.titleTextAttributes = attrs
        navBar.setBackgroundImage(UIImage(named: "navigationbarBackgroundWhite"), for: .default)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(normal: "navigationButtonReturn", highlighted: "navigationButtonReturnClick", addTarget: self, action: #selector(backButtonClick), title: "返回")
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return childViewControllers.count > 1
    }
    
    func backButtonClick() {
        popViewController(animated: true)
    }
    
}
