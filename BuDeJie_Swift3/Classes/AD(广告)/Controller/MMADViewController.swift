//
//  MMADViewController.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 02/02/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit
import AFNetworking
import MJExtension
import SDWebImage

class MMADViewController: UIViewController {

    @IBOutlet weak var launchImageView: UIImageView!
    @IBOutlet weak var adView: UIView!
    @IBOutlet weak var adTimerButton: UIButton!
    
    static var adTime: Int?
    var adItem: MMADItem?
    var adTimer: Timer?
    lazy var adImageView: UIImageView = self.initAdImageView()
    
    @IBAction func adTimerButtonClick() {
        let tabBarVC = MMTabBarController()
        UIApplication.shared.keyWindow?.rootViewController = tabBarVC
        
        adTimer?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLaunchImage()
        loadAdData()
        
        MMADViewController.adTime = 3
        adTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MMADViewController.timerChange), userInfo: nil, repeats: true)
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
    
    func loadAdData() {
        let manager = AFHTTPSessionManager()
        
        var params = [String : String]()
        params["code2"] = "phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"
        
        manager.get("http://mobads.baidu.com/cpro/ui/mads.php",
                    parameters: params,
                    progress: nil,
                    success: { (task, responseObject) in
                        
                        guard let responseObject = responseObject as? [String : Any] else {
                            return
                        }
                        
                        guard let response = responseObject["ad"] as? [Any] else {
                            return
                        }
                        
                        if let item = MMADItem.mj_object(withKeyValues: response.last) {
                            self.adItem = item
                            
                            let height = UIScreen.main.bounds.width / (self.adItem?.w)! * (self.adItem?.h)!
                            
                            self.adImageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height)
                            self.adImageView.sd_setImage(with: URL(string: (self.adItem?.w_picurl)!))
                        }
                        
        },
                    failure: { (task, error) in
                        print(error)
        })
    }
    
    func adTap() {
        let url = URL(string: (adItem?.ori_curl)!)
        let app = UIApplication.shared
        
        if app.canOpenURL(url!) {
            app.openURL(url!)
        }
    }
    
    func timerChange() {
        if MMADViewController.adTime == 0 {
            adTimerButtonClick()
        }
        
        MMADViewController.adTime! -= 1
        adTimerButton.setTitle("跳过 (\(MMADViewController.adTime!))", for: .normal)
    }
    
    private func initAdImageView() -> UIImageView {
        let imageView = UIImageView()
        adView.addSubview(imageView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(MMADViewController.adTap))
        
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }
}
