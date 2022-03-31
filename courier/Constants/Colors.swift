//
//  Colors.swift
//  courier
//
//  Created by Владимир Свиридов on 18.01.2022.
//

import UIKit.UIColor

// Для смены цветовой палитры использовать глобальную переменную
// для темной темы создать например структуру и где происходит выбор цвета создать тернарный оператор с этой переменной

struct Colors {

    static let isDarkMode = UserDefaults.standard.bool(forKey: UserDefaultsKeys.isDarkMode)

    static let lightGreen = UIColor(hexString: (isDarkMode ? "#16d91c" : "#16d91c"))
    static let lightGray = UIColor(hexString: (isDarkMode ? "#e6e6e6" : "#e6e6e6"))
    static let gray = UIColor(hexString: (isDarkMode ? "#a6a6a6" : "#a6a6a6"))
    static let black = UIColor(hexString: (isDarkMode ? "#000000" : "#000000"))
    static let yellow = UIColor(hexString: (isDarkMode ? "#ffdb4d" : "#ffdb4d"))
    static let white = UIColor(hexString: (isDarkMode ? "#b4c6d2" : "#ffffff"))
    static let green = UIColor(hexString: (isDarkMode ? "#78b833" : "#78b833"))
    static let orange = UIColor(hexString: (isDarkMode ? "#fab600" : "#fab600"))
    static let red = UIColor(hexString: (isDarkMode ? "#e31e24" : "#e31e24"))
    static let white2 = UIColor(hexString: (isDarkMode ? "#fefefe" : "#fefefe"))
    static let darkGray = UIColor(hexString: (isDarkMode ? "#808080" : "#808080"))
    static let lightBlueDark = UIColor(hexString: (isDarkMode ? "#0090cc" : "#0090cc"))
    static let lightBlue = UIColor(hexString: (isDarkMode ? "#00a0e3" : "#00a0e3"))
    static let white3 = UIColor(hexString: (isDarkMode ? "#fcfcfc" : "#fcfcfc" ))
    static let lightRed = UIColor(hexString: (isDarkMode ? "#FFF5F5" : "#FFF5F5"))
    static let scarletRed = UIColor(hexString: (isDarkMode ? "#FF8083" : "#FF8083"))
    static let backgroundColor = UIColor(hexString: (isDarkMode ? "#f7f7f7" : "#f7f7f7"))
    
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
