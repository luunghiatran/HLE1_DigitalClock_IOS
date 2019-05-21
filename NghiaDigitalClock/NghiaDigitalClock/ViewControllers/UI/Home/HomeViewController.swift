//
//  HomeViewController.swift
//  NghiaDigitalClock
//
//  Created by TrungNguyen on 5/14/19.
//  Copyright © 2019 BTS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var secondLabel: UILabel?
    @IBOutlet weak var weekDayLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.updateUI()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        timeLabel?.text = String(format: "%02d:%02d", hour, minutes)
        
        let second = calendar.component(.second, from: date)
        secondLabel?.text = String(format: ":%02d", second)
        
        
        let formater = DateFormatter()
        formater.dateFormat = "EEE"
        let weekDay = formater.string(from: date)
        weekDayLabel?.text = "\(weekDay)"
        
        formater.dateFormat = "MMM dd, yyyy"
        let dateStr = formater.string(from: date)
        dateLabel?.text = "\(dateStr)"
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
