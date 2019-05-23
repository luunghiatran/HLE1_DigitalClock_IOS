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

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }
    
    private func initView() {
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
        cell?.setData(data: ClockType.allvalues[indexPath.item])
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let with = (collectionView.bounds.width - 10 - 10 - 10) * 1/2 // 30 = left + right + vertial_margin
        return CGSize(width: with, height: 200)
    }
}
