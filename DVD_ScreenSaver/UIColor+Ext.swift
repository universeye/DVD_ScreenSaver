//
//  UIColor+Ext.swift
//  DVD_ScreenSaver
//
//  Created by Terry Kuo on 2022/5/6.
//

import UIKit

extension UIColor {
    static func generateRandomColor() -> UIColor {
        let hue = CGFloat(arc4random() % 256) / 256
        return UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
    }
    
}
