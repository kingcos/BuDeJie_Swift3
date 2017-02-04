//
//  MMSTableViewController.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 03/02/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit
import AFNetworking
import MJExtension
import SVProgressHUD

class MMSubscriberTableViewController: UITableViewController {

    let subscriberId = "subscriber_cell"
    var subscriberItems = NSMutableArray()
    let manager = AFHTTPSessionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSubcriberData()
        
        tableView.register(UINib(nibName: String(describing: MMSubscriberTableViewCell.self), bundle: nil), forCellReuseIdentifier: subscriberId)
        title = "推荐标签"
        
//        tableView.separatorInset = UIEdgeInsets.zero
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1)
        
        SVProgressHUD.show(withStatus: "正在加载...")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        SVProgressHUD.dismiss()
        manager.tasks.forEach { (task) in
            task.cancel()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subscriberItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let subscriberId = "subscriber_cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: subscriberId) as! MMSubscriberTableViewCell
        
//        if cell == nil {
//            cell = Bundle.main.loadNibNamed(String(describing: MMSubscriberTableViewCell.self), owner: nil, options: nil)?[0] as! UITableViewCell?
//        }
        
        let subscriberItem = subscriberItems[indexPath.row] as? MMSubscriber
        cell.item = subscriberItem
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func loadSubcriberData() {
        var params = [String : String]()
        params["a"] = "tag_recommend"
        params["action"] = "sub"
        params["c"] = "topic"
        
        manager.get("http://api.budejie.com/api/api_open.php",
                    parameters: params,
                    progress: nil,
                    success: { (task, responseObject) in
                        SVProgressHUD.dismiss()
                        
                        self.subscriberItems = MMSubscriber.mj_objectArray(withKeyValuesArray: responseObject)
                        self.tableView.reloadData()
        },
                    failure: { (task, error) in
                        SVProgressHUD.dismiss()
                        
                        print(error)
        })
    }

}
