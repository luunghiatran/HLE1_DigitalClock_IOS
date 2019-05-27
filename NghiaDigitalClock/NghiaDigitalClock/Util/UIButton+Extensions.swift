//
//  UIButtonExt.swift
//  NghiaDigitalClock
//
//  Created by NghiaTL on 5/24/19.
//  Copyright © 2019 BTS. All rights reserved.
//

import UIKit

extension UIButton {
    
    func renderImage(withColor color: UIColor) {
        let image = self.image(for: .normal)?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        if image != nil {
            self.setImage(image, for: .normal)
            self.tintColor = color
            self.setTitleColor(color, for: .normal)
        }
    }
    
}
