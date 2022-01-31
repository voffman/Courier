//
//  Colors.swift
//  courier
//
//  Created by Владимир Свиридов on 18.01.2022.
//

import UIKit.UIColor

struct Colors {
    
    static let lightGreen = UIColor(hexString: "#16d91c")
    static let lightGray = UIColor(hexString: "#e6e6e6")
    static let gray = UIColor(hexString: "#a6a6a6")
    static let black = UIColor(hexString: "#000000")
    static let yellow = UIColor(hexString: "#ffdb4d")
    static let white = UIColor(hexString: "#ffffff")
    static let green = UIColor(hexString: "#78b833")
    static let orange = UIColor(hexString: "#fab600")
    static let red = UIColor(hexString: "#e31e24")
    static let white2 = UIColor(hexString: "#fefefe") // не используется в XD
    static let darkGray = UIColor(hexString: "#808080")
    static let lightBlueDark = UIColor(hexString: "#0090cc")
    static let lightBlue = UIColor(hexString: "#00a0e3")
    static let white3 = UIColor(hexString: "#fcfcfc") // не используется в XD
    static let lightRed = UIColor(hexString: "#FFF5F5")
    static let scarletRed = UIColor(hexString: "#FF8083")
    
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
