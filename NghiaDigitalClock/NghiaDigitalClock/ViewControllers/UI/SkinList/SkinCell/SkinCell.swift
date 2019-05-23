//
//  SkinCell.swift
//  NghiaDigitalClock
//
//  Created by NghiaTL on 5/23/19.
//  Copyright © 2019 BTS. All rights reserved.
//

import UIKit

class SkinCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var weekDayLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(data: ClockType) {
        // Set color
        let colorStr = data.rawValue
        timeLabel
        
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
    }
}
