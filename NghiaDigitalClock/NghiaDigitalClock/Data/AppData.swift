//
//  Data.swift
//  NghiaDigitalClock
//
//  Created by NghiaTL on 5/24/19.
//  Copyright © 2019 BTS. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    static let selectedClockType = DefaultsKey<ClockType?>("clock_type", defaultValue: ClockType.amber)
}

class AppData {
    static func saveSelectedClockType(clockType: ClockType?) {
        Defaults[.selectedClockType] = clockType!
    }
    
    static func getSelectedClockType() -> ClockType {
        return Defaults[DefaultsKeys.selectedClockType] ?? ClockType.red
    }
}
