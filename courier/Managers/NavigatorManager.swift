//
//  NavigatorManager.swift
//  courier
//
//  Created by Владимир Свиридов on 29.04.2022.
//

import Foundation

class NavigatorManager {
    
    func getCoordinates(latitude: String, longitude: String) -> URL{
        let defaultNavigator = UserDefaults.standard.string(forKey: UserDefaultsKeys.defaultNavigator)
        var urlString = ""
        
        if defaultNavigator == Navigators.doubleGIS{
            urlString = "dgis://2gis.ru/routeSearch/rsType/car/to/\(longitude),\(latitude)"
        }
        else if defaultNavigator == Navigators.yandex {
           urlString = "yandexmaps://maps.yandex.ru/?ll=\(longitude),\(latitude)&z=12&l=map"
        }
        else {
            urlString = "http://maps.apple.com/maps?daddr=\(latitude),\(longitude)"
        }
        
        let url = URL(string: urlString)!
        return url
         
    }
    
    func openDownloadLink() -> URL {
        let defaultNavigator = UserDefaults.standard.string(forKey: UserDefaultsKeys.defaultNavigator)
        var urlString = ""
        // Ошибка так как The iOS Simulator does not have an App Store.
        if defaultNavigator == Navigators.doubleGIS{
            urlString = "https://itunes.apple.com/ru/app/id481627348?mt=8"
           // urlString = "https://www.google.ru/"
        }
        else if defaultNavigator == Navigators.yandex {
           urlString = "https://itunes.apple.com/ru/app/yandex.navigator/id474500851"
        }
        
        let url = URL(string: urlString)!
        return url
    }    
}
