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

    let navigatorManager = NavigatorManager()
    
    func routeButtonTapped(latitude: String, longitude: String){
        view?.openApp(appURL: navigatorManager.getCoordinates(latitude: latitude, longitude: longitude))
    }
    
    func navigationAppIsNotAvailable() {
        view?.openApp(appURL: navigatorManager.openDownloadLink())
    }
    
    func toCallButtonTapped(phoneNumber: String) {
        let urlString = "tel://" + phoneNumber
        guard let url = URL(string: urlString) else { return }
        
        view?.openApp(appURL: url)
    }
}
