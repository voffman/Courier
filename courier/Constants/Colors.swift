//
//  Colors.swift
//  courier
//
//  Created by Владимир Свиридов on 18.01.2022.
//

import UIKit.UIColor

struct Colors {

    static let isDarkMode = UserDefaults.standard.bool(forKey: UserDefaultsKeys.isDarkMode)

    static let lightGreen = UIColor(hexString: (isDarkMode ? "#16d91c" : "#16d91c")) // -
    static let lightGray = UIColor(hexString: (isDarkMode ? "#1A1A1A" : "#e6e6e6")) // grey1
    static let gray = UIColor(hexString: (isDarkMode ? "#737373" : "#a6a6a6")) // grey2
    static let black = UIColor(hexString: (isDarkMode ? "#FFFFFF" : "#000000")) // onSurface
    static let yellow = UIColor(hexString: (isDarkMode ? "#FFA500" : "#FF8C00")) // warning? изн #ffdb4d
    static let white = UIColor(hexString: (isDarkMode ? "#000000" : "#FFFFFF")) //OnPrimary
    static let green = UIColor(hexString: (isDarkMode ? "#16D91C" : "#78b833")) // Success
    static let orange = UIColor(hexString: (isDarkMode ? "#fab600" : "#fab600")) // Primary? изн #fab600 схема #FFCB08
    static let red = UIColor(hexString: (isDarkMode ? "#e31e24" : "#e31e24")) // red
    static let white2 = UIColor(hexString: (isDarkMode ? "#fefefe" : "#fefefe")) //
    static let darkGray = UIColor(hexString: (isDarkMode ? "#8C8C8C" : "#808080")) // grey3
    static let lightBlueDark = UIColor(hexString: (isDarkMode ? "#0090cc" : "#0090cc")) //
    static let lightBlue = UIColor(hexString: (isDarkMode ? "#00a0e3" : "#00a0e3")) //
    static let white3 = UIColor(hexString: (isDarkMode ? "#fcfcfc" : "#fcfcfc" )) //
    static let lightRed = UIColor(hexString: (isDarkMode ? "#582024" : "#FFF5F5")) // additional? изн #FFF5F5 схема #fff3cd
    static let scarletRed = UIColor(hexString: (isDarkMode ? "#E31E24" : "#FF8083")) // danger
    static let backgroundColor = UIColor(hexString: (isDarkMode ? "#0D0D0D" : "#F7F7F7")) // background
    
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
