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
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: [String]) {
        // data = ["Display Settings", "ic_display_settings"]
        titleLable.text = data[0]
        iconImage.image = UIImage(named: data[1])
    }
}
