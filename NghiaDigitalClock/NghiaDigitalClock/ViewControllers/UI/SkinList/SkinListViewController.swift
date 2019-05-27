//
//  SkinListViewController.swift
//  NghiaDigitalClock
//
//  Created by NghiaTL on 5/21/19.
//  Copyright © 2019 BTS. All rights reserved.
//

import UIKit

class SkinListViewController: UIViewController {
    
    @IBOutlet weak var skinCollectionView: UICollectionView!
    
    private var selectedSkinHandler: SkinSelectHandler?
    
    private var checkedIndex: IndexPath = IndexPath(item: 0, section: 0)
    
    static func create() -> SkinListViewController {
        return SkinListViewController(nibName: "SkinListViewController", bundle: nil) as SkinListViewController
    }

    @discardableResult
    public func onSelectedSkinHandler(_ handler: @escaping SkinSelectHandler) -> SkinListViewController {
        self.selectedSkinHandler = handler
        return self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
}

extension SkinListViewController {
    @IBAction func backButtonTouch( _ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil) // Clear all Stack
    }
}

extension SkinListViewController {
    
    private func initView() {
        // === Title ===
        self.title = "Skin"
        
        let backBarButton = UIBarButtonItem(image: UIImage(named: "ic_arrow_back"), style: .done, target: self, action: #selector(self.backButtonTouch(_:)))
        self.navigationItem.setLeftBarButton(backBarButton, animated: true)
        
        // === Checked Index ===
        let selectedClockType = AppData.getSelectedClockType()
        var index = 0
        while index < ClockType.allvalues.count {
            if ClockType.allvalues[index] == selectedClockType {
                checkedIndex = IndexPath(row: index, section: 0)
            }
            index += 1
        }
        
        // === Init Skin ===
        skinCollectionView.register(UINib(nibName: "SkinCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        skinCollectionView.delegate = self
        skinCollectionView.dataSource = self
        
        // Padding cell
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // List's margin
        layout.minimumInteritemSpacing = 10 // Margin Vertical Space
        layout.minimumLineSpacing = 10  // Margin Horizone Space
        skinCollectionView.collectionViewLayout = layout
    }
}

extension SkinListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ClockType.allvalues.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SkinCell
        
        let data = ClockType.allvalues[indexPath.item]
        //var checkedData = ClockType.allvalues[checkedIndex]
        cell?.setData(data: data, index: indexPath, checkedIndex: checkedIndex)
        
        return cell!
    }
    
    // Set Cell Width + Cell number
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let with = (collectionView.bounds.width - 10 - 10 - 10) * 1/2 // 30 = left + right + vertial_margin
        return CGSize(width: with, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath != checkedIndex {
            // show checked
            let oldCheckedIndex = checkedIndex
            checkedIndex = indexPath
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SkinCell
            cell?.setChecked(checkedIndex: checkedIndex)
            
            let reloadItems = [oldCheckedIndex, checkedIndex]
            collectionView.reloadItems(at: reloadItems)
            
            // save, close, apply home
            let selectedClockType = ClockType.allvalues[indexPath.item]
            AppData.saveSelectedClockType(clockType: selectedClockType)
            
            self.selectedSkinHandler!(self, selectedClockType)
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
}
