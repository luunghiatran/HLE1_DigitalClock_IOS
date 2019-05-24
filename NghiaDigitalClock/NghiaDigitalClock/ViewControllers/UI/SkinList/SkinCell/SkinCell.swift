//
//  SkinCell.swift
//  NghiaDigitalClock
//
//  Created by NghiaTL on 5/23/19.
//  Copyright © 2019 BTS. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

class SkinCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var weekDayLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var checkedImage: UIImageView?
    
    var cellIndex: IndexPath = IndexPath(row: 0, section: 0)
    var checkedIndex: IndexPath = IndexPath(row: 0, section: 0)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(data: ClockType, index: IndexPath, checkedIndex: IndexPath) {
        self.cellIndex = index
       
        // Set data
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        timeLabel?.text = String(format: "%02d:%02d", hour, minutes)
        
        let formater = DateFormatter()
        formater.dateFormat = "EEE"
        let weekDay = formater.string(from: date)
        weekDayLabel?.text = "\(weekDay)"
        
        formater.dateFormat = "MMM dd, yyyy"
        let dateStr = formater.string(from: date)
        dateLabel?.text = "\(dateStr)"
        
        // Set color
        let color = UIColor(data.rawValue)
        timeLabel?.textColor = color
        weekDayLabel?.textColor = color
        dateLabel?.textColor = color
        
        // Set checked
        setChecked(checkedIndex: checkedIndex)
    }
    
    func setChecked(checkedIndex: IndexPath) {
        if self.cellIndex == checkedIndex {
            checkedImage?.isHidden = false
        } else {
            checkedImage?.isHidden = true
        }
    }
}
