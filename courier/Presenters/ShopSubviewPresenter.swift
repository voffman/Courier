//
//  ShopSubviewPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю в здесь
protocol ShopSubviewPresenterProtocol: AnyObject {
    init(view: ShopSubviewProtocol)
    func routeButtonTapped(latitude: String, longitude: String)
    func navigationAppIsNotAvailable()
    func toCallButtonTapped(phoneNumber: String)
}

class ShopSubviewPresenter: ShopSubviewPresenterProtocol {
    weak var view: ShopSubviewProtocol?
    
    required init(view: ShopSubviewProtocol) {
        self.view = view
    }

    
    func routeButtonTapped(latitude: String, longitude: String){
        let defaultNavigator = UserDefaults.standard.string(forKey: UserDefaultsKeys.defaultNavigator)
        var urlString = ""
        
        if defaultNavigator == "2ГИС"{
            urlString = "dgis://2gis.ru/routeSearch/rsType/car/to/\(longitude),\(latitude)"
        }
       else if defaultNavigator == "Яндекс Навигатор" {
           urlString = "yandexmaps://maps.yandex.ru/?ll=\(longitude),\(latitude)&z=12&l=map"
        }
        else {
            urlString = "http://maps.apple.com/maps?daddr=\(latitude),\(longitude)"
        }
        
        //
        guard let url = URL(string: urlString) else { return }
        view?.openApp(appURL: url)
         
    }
    
    func navigationAppIsNotAvailable() {
        let defaultNavigator = UserDefaults.standard.string(forKey: UserDefaultsKeys.defaultNavigator)
        var urlString = ""
        // Ошибка так как The iOS Simulator does not have an App Store.
        if defaultNavigator == "2ГИС"{
            urlString = "https://itunes.apple.com/ru/app/id481627348?mt=8"
           // urlString = "https://www.google.ru/"
        }
       else if defaultNavigator == "Яндекс Навигатор" {
           urlString = "https://itunes.apple.com/ru/app/yandex.navigator/id474500851"
        }
        
        //
        guard let url = URL(string: urlString) else { return }
        view?.openApp(appURL: url)
    }
    
    func toCallButtonTapped(phoneNumber: String) {
        let urlString = "tel://" + phoneNumber
        guard let url = URL(string: urlString) else { return }
        
        view?.openApp(appURL: url)
    }
}
