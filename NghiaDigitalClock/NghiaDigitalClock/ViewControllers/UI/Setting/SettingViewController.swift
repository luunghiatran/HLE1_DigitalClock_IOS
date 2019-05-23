//
//  SettingViewController.swift
//  NghiaDigitalClock
//
//  Created by NghiaTL on 5/21/19.
//  Copyright © 2019 BTS. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    let itemList = [
        [
            ["Display Settings", "ic_display_settings", "", true],
            ["Alarm Clock", "ic_alarm_clock", "OFF", true],
            ["Hourly Alarm", "ic_hourly_alarm", "ON", true]
        ],
        [
            ["All clock skins", "ic_all_skins", "", true],
            ["Remove Ads", "ic_remove_ads", "đ22,00", false],
            ["All Pro Features", "ic_hourly_alarm", "đ45,00", false]
        ]
    ]
    let headerList = ["Settings", "Pro Features"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        initItemTableView()
        
        //print(itemList[0][0]) // ["Display Settings", "ic_display_settings"]
        //print(itemList[0][0][0])
    }
    
    func initUI() {
        self.title = "Setting"
        
        let backBarButton = UIBarButtonItem(image: UIImage(named: "ic_arrow_back"), style: .done, target: self, action: #selector(self.backButtonTouch(_:)))
        self.navigationItem.setLeftBarButton(backBarButton, animated: true)
    }
    
    func initItemTableView() {
        menuTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        menuTableView.dataSource = self
        menuTableView.delegate = self
        menuTableView.separatorStyle = .none
        // Header
        menuTableView.register(UINib(nibName: "HeaderCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderCell")
    }

    @IBAction func backButtonTouch( _ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil) // Clear all Stack
    }
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Number row on Current Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as? MenuCell
        let data = itemList[indexPath.section][indexPath.row]
        cell?.setData(data: data, indexPath: indexPath, sectionItems: itemList[indexPath.section].count)
        return cell!
    }

    // === HEADER ===
    func numberOfSections(in tableView: UITableView) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderCell") as? HeaderCell
        headerView?.setData(data: headerList[section])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    // line in Footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 1))
        view.backgroundColor = UIColor.white
        return view
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
}
