//
//  HeaderCell.swift
//  NghiaDigitalClock
//
//  Created by NghiaTL on 5/22/19.
//  Copyright © 2019 BTS. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewHeaderFooterView {

    @IBOutlet weak var headerLabel: UILabel!
    
    func setData(data: String) {
        headerLabel.text = data
    }
}
