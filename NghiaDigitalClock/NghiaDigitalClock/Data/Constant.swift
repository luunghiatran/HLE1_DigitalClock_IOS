//
//  Constant.swift
//  NghiaDigitalClock
//
//  Created by NghiaTL on 5/24/19.
//  Copyright © 2019 BTS. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

enum ClockType: String, DefaultsSerializable {
    case red = "#f44336"
    case pink = "#e91e63"
    case purple = "#9c27b0"
    case deepPurple = "#673ab7"
    case indigo = "#3f51b5"
    case blue = "#2196f3"
    case lightBlue = "#03a9f4"
    case cyan = "#00bcd4"
    case teal = "#009688"
    case green = "#4caf50"
    case lightGreen = "#8bc34a"
    case lime = "#cddc39"
    case yellow = "#ffeb3b"
    case amber = "#ffc107"
    case orange = "#ff9800"
    case deepOrange = "#ff5722"
    case brown = "#795548"
    case grey = "#9e9e9e"
    case blueGrey = "#607d8b"
    
    static var allvalues = [red, pink, purple, deepPurple, indigo, blue, lightBlue, cyan, teal, green, lightGreen, lime, yellow, amber, orange, deepOrange, brown, grey, blueGrey]
}

typealias SkinSelectHandler = (UIViewController, ClockType) -> (Void)
