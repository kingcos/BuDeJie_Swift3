//
//  MMADViewController.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 02/02/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

class MMADViewController: UIViewController {

    @IBOutlet weak var launchImageView: UIImageView!
    @IBOutlet weak var adView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLaunchImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLaunchImage() {
        let height = UIScreen.main.bounds.height
        
        switch height {
        case 736:
            launchImageView.image = UIImage(named: "LaunchImage-800-Portrait-736h")
        case 568:
            launchImageView.image = UIImage(named: "LaunchImage-568h")
        default:
            launchImageView.image = UIImage(named: "LaunchImage-800-667h")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
