//
//  HomeViewController.swift
//  NghiaDigitalClock
//
//  Created by TrungNguyen on 5/14/19.
//  Copyright © 2019 BTS. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

class HomeViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var secondLabel: UILabel?
    @IBOutlet weak var weekDayLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var showSettingButton: UIButton?
    @IBOutlet weak var showSkinButton: UIButton?
    @IBOutlet weak var showAlarmButton: UIButton?
    @IBOutlet weak var showTimerButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setUpTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// === Private Funtion ===
extension HomeViewController {

    private func setUpTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.updateUITime()
        }
    }

    private func updateUI() {
        updateUITime()
        updateUIColor()
    }

    private func updateUITime() {
        // === Set data ===
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

    private func updateUIColor() {
        // === Set color ===
        let colorStr = AppData.getSelectedClockType().rawValue
        let color = UIColor(colorStr)
        timeLabel?.textColor = color
        secondLabel?.textColor = color
        weekDayLabel?.textColor = color
        dateLabel?.textColor = color
        
        showSettingButton?.renderImage(withColor: color)
        showSkinButton?.renderImage(withColor: color)
        showAlarmButton?.renderImage(withColor: color)
        showTimerButton?.renderImage(withColor: color)
    }

    private func setButtonTintImage(button: UIButton?, color: UIColor) {
        let image = button?.image(for: .normal)?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        button?.setImage(image, for: .normal)
        button?.tintColor = color
        button?.titleLabel?.textColor = color
    }

}

// === IBAction Group ===
extension HomeViewController {

    @IBAction func showSetting (_ sender: Any) {
        let controller = SettingViewController(nibName: "SettingViewController", bundle: nil)
        let nav = UINavigationController(rootViewController: controller)
        self.present(nav, animated: true, completion: nil) // use for first Nav VC ==== present - close by Dismiss
        //self.navigationController?.dismiss(animated: true, completion: nil) // Clear all Stack
    }

    @IBAction func showSkinList (_ sender: Any) {
        let handler: SkinSelectHandler = { [weak self](controller, type) in
            // VC giữ handler có thể huỷ, không cần giữ vùng nhớ
            guard let `self` = self else { return }
            self.updateUIColor()
        }

        let controller = SkinListViewController
            .create()
            .onSelectedSkinHandler(handler)
        let nav = UINavigationController(rootViewController: controller)
        self.present(nav, animated: true, completion: nil)
    }
}
