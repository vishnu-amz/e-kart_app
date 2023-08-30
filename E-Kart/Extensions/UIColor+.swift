//
//  UITextField+.swift
//  E-Kart
//
//  Created by Vishnu - iOS on 29/08/23.
//

import Foundation
import UIKit

extension UIColor {

    static func appColor(_ name: String) -> UIColor {
        switch name {
        case "pink":
            return UIColor(hexString: "#fae7e7", alpha: 0.80)
        case "yellow":
            return UIColor(hexString: "#f8f3c9", alpha: 0.80)
        case "lightpink":
            return UIColor(hexString: "#fcf0f0", alpha: 0.80)
        case "violet":
            return UIColor(hexString: "#e8dbf4", alpha: 0.80)
        case "orange":
            return UIColor(hexString: "#fff2d9", alpha: 0.80)
        default:
            return UIColor(hexString: "#8c8d8e", alpha: 0.80)
        }
    }
    
    
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)

        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }

        var color: UInt32 = 0
        scanner.scanHexInt32(&color)

        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask

        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0

        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }

    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format:"#%06x", rgb)
    }
    
}
