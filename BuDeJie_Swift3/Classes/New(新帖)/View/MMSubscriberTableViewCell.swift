//
//  MMSubscriberTableViewCell.swift
//  BuDeJie_Swift3
//
//  Created by 买明 on 03/02/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit
import SDWebImage

class MMSubscriberTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subscriberNumberLabel: UILabel!
    
    var item: MMSubscriber? {
        willSet {
            if let newValue = newValue {
                //                mainImageView.sd_setImage(with: URL(string: newValue.image_list), placeholderImage: #imageLiteral(resourceName: "defaultUserIcon"))
                titleLabel.text = newValue.theme_name
                
                var subNumber = newValue.sub_number
                if Int(subNumber)! > 10000 {
                    subNumber = String(format: "%.1f万", Double(subNumber)! / 10000.0)
                    subNumber = subNumber.replacingOccurrences(of: ".0", with: "")
                }
                subscriberNumberLabel.text = subNumber + "人已关注"
                
                mainImageView.sd_setImage(with: URL(string: newValue.image_list), placeholderImage: #imageLiteral(resourceName: "defaultUserIcon"), options: .cacheMemoryOnly, completed: { (image, error, cacheType, url) in
                    UIGraphicsBeginImageContextWithOptions((image?.size)!, false, 0.0)
                    let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: (image?.size.width)!, height: (image?.size.height)!))
                    path.addClip()
                    image?.draw(at: CGPoint.zero)
                    let newImage = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                    self.mainImageView.image = newImage
                })
            }
        }
    }
    
    override var frame: CGRect {
        didSet {
            var newFrame = frame
            newFrame.size.height -= 1
            super.frame = newFrame
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        mainImageView.layer.cornerRadius = 30.0
//        mainImageView.layer.masksToBounds = true
        
//        layoutMargins = UIEdgeInsets.zero
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
