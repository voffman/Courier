//
//  Colors.swift
//  courier
//
//  Created by Владимир Свиридов on 18.01.2022.
//

import UIKit.UIColor

struct Colors {

    static let isDarkMode = UserDefaults.standard.bool(forKey: UserDefaultsKeys.isDarkMode)

    static var lightGreen = UIColor(hexString: (isDarkMode ? "#16d91c" : "#16d91c")) // -
    static var lightGray = UIColor(hexString: (isDarkMode ? "#1A1A1A" : "#e6e6e6")) // grey1
    static var gray = UIColor(hexString: (isDarkMode ? "#737373" : "#a6a6a6")) // grey2
    static var black = UIColor(hexString: (isDarkMode ? "#FFFFFF" : "#000000")) // onSurface
    static var yellow = UIColor(hexString: (isDarkMode ? "#FFA500" : "#FF8C00")) // warning? изн #ffdb4d
    static var white = UIColor(hexString: (isDarkMode ? "#000000" : "#FFFFFF")) //OnPrimary
    static var green = UIColor(hexString: (isDarkMode ? "#16D91C" : "#78b833")) // Success
    static var orange = UIColor(hexString: (isDarkMode ? "#fab600" : "#fab600")) // Primary? изн #fab600 схема #FFCB08
    static var red = UIColor(hexString: (isDarkMode ? "#e31e24" : "#e31e24")) // red
    static var white2 = UIColor(hexString: (isDarkMode ? "#fefefe" : "#fefefe")) //
    static var darkGray = UIColor(hexString: (isDarkMode ? "#8C8C8C" : "#808080")) // grey3
    static var lightBlueDark = UIColor(hexString: (isDarkMode ? "#0090cc" : "#0090cc")) //
    static var lightBlue = UIColor(hexString: (isDarkMode ? "#00a0e3" : "#00a0e3")) //
    static var white3 = UIColor(hexString: (isDarkMode ? "#fcfcfc" : "#fcfcfc" )) //
    static var lightRed = UIColor(hexString: (isDarkMode ? "#582024" : "#FFF5F5")) // additional? изн #FFF5F5 схема #fff3cd
    static var scarletRed = UIColor(hexString: (isDarkMode ? "#E31E24" : "#FF8083")) // danger
    static var backgroundColor = UIColor(hexString: (isDarkMode ? "#0D0D0D" : "#F7F7F7")) // background
    
    
    func changeColorsToDark(){
        Colors.lightGreen = UIColor(hexString: "#16d91c")
        Colors.lightGray = UIColor(hexString: "#1A1A1A")
        Colors.gray = UIColor(hexString: "#737373")
        Colors.black = UIColor(hexString: "#FFFFFF")
        Colors.yellow = UIColor(hexString: "#FFA500")
        Colors.white = UIColor(hexString: "#000000")
        Colors.green = UIColor(hexString: "#16D91C")
        Colors.orange = UIColor(hexString: "#fab600")
        Colors.red = UIColor(hexString: "#e31e24")
        Colors.white2 = UIColor(hexString: "#fefefe")
        Colors.darkGray = UIColor(hexString: "#8C8C8C")
        Colors.lightBlueDark = UIColor(hexString: "#0090cc")
        Colors.lightBlue = UIColor(hexString: "#00a0e3")
        Colors.white3 = UIColor(hexString: "#fcfcfc")
        Colors.lightRed = UIColor(hexString: "#582024")
        Colors.scarletRed = UIColor(hexString: "#E31E24")
        Colors.backgroundColor = UIColor(hexString: "#0D0D0D")
    }
    
    func changeColorsToLight(){
        Colors.lightGreen = UIColor(hexString: "#16d91c")
        Colors.lightGray = UIColor(hexString: "#e6e6e6")
        Colors.gray = UIColor(hexString: "#a6a6a6")
        Colors.black = UIColor(hexString: "#000000")
        Colors.yellow = UIColor(hexString: "#FF8C00")
        Colors.white = UIColor(hexString: "#FFFFFF")
        Colors.green = UIColor(hexString: "#78b833")
        Colors.orange = UIColor(hexString: "#fab600")
        Colors.red = UIColor(hexString: "#e31e24")
        Colors.white2 = UIColor(hexString: "#fefefe")
        Colors.darkGray = UIColor(hexString: "#808080")
        Colors.lightBlueDark = UIColor(hexString: "#0090cc")
        Colors.lightBlue = UIColor(hexString: "#00a0e3")
        Colors.white3 = UIColor(hexString: "#fcfcfc")
        Colors.lightRed = UIColor(hexString: "#FFF5F5")
        Colors.scarletRed = UIColor(hexString: "#FF8083")
        Colors.backgroundColor = UIColor(hexString: "#F7F7F7")
    }
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
