//
//  UIColor+FlowrSpot.swift
//  FlowrSpot
//
//  Created by TK on 04/11/2017.
//  Copyright © 2017 Povio Labs. All rights reserved.
//

import PovioKit
import UIKit

extension UIColor {
  static let flowrGray = UIColor(red: 148, green: 158, blue: 160)
  static let flowrDarkGray = UIColor(red: 212, green: 216, blue: 217)
  static let flowrPink = UIColor(red: 223, green: 145, blue: 134)
  static let separatorColor = UIColor(red: 0.91, green: 0.91, blue: 0.93, alpha: 1)
  static let sightingIconColor = UIColor(red: 0.83, green: 0.85, blue: 0.85, alpha: 1)
}

extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
