//
//  Colors.swift
//  courier
//
//  Created by Владимир Свиридов on 18.01.2022.
//

import UIKit.UIColor

struct Colors {

    static var isDarkMode = UserDefaults.standard.bool(forKey: UserDefaultsKeys.isDarkMode)

    static var lightGreen: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#16d91c" : "#16d91c"))
        }
    }
    
    static var lightGray: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#1A1A1A" : "#e6e6e6"))
        }
    }
    
    static var gray: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#737373" : "#a6a6a6"))
        }
    }
    
    static var black: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#FFFFFF" : "#000000"))
        }
    }
    
    static var yellow: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#FFA500" : "#FF8C00"))
        }
    }
    
    static var white: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#000000" : "#FFFFFF"))
        }
    }
    
    static var green: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#16D91C" : "#78b833"))
        }
    }
    
    static var orange: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#fab600" : "#fab600"))
        }
    }
    
    static var red: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#e31e24" : "#e31e24"))
        }
    }
    
    static var white2: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#fefefe" : "#fefefe"))
        }
    }
    
    static var darkGray: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#8C8C8C" : "#808080"))
        }
    }
    
    static var lightBlueDark: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#0090cc" : "#0090cc"))
        }
    }
    
    static var lightBlue: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#00a0e3" : "#00a0e3"))
        }
    }
    
    static var white3: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#fcfcfc" : "#fcfcfc" ))
        }
    }
    
    static var lightRed: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#582024" : "#FFF5F5"))
        }
    }
    
    static var scarletRed: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#E31E24" : "#FF8083"))
        }
    }
    
    static var backgroundColor: UIColor {
        get {
            return UIColor(hexString: (isDarkMode ? "#0D0D0D" : "#F7F7F7"))
        }
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
