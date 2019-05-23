//
//  MenuCell.swift
//  NghiaDigitalClock
//
//  Created by NghiaTL on 5/21/19.
//  Copyright © 2019 BTS. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subTitleLable: UILabel!
    @IBOutlet weak var iconArrowImage: UIImageView!
    @IBOutlet weak var bottomLineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(data: [Any], indexPath: IndexPath, sectionItems: Int) {
        // data = ["Display Settings", "ic_display_settings", "", true],
        titleLable.text = data[0] as? String ?? ""
        iconImage.image = UIImage(named: data[1] as? String ?? "")
        subTitleLable.text = data[2] as? String ?? ""
        
        let showArrow = data[3] as? Bool
        if showArrow == true {
            iconArrowImage.isHidden = false
        } else {
            iconArrowImage.isHidden = true
        }
        if indexPath.row == sectionItems - 1 {
            bottomLineView.isHidden = true
        } else {
            bottomLineView.isHidden = false
        }
    }
}
