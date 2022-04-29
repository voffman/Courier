//
//  ClientSubviewPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation


// То, что выполняю в здесь
protocol ClientSubviewPresenterProtocol: AnyObject {
    init(view: ClientSubviewProtocol)
    func routeButtonTapped(latitude: String, longitude: String)
    func navigationAppIsNotAvailable()
    func toCallButtonTapped(phoneNumber: String)
}

class ClientSubviewPresenter: ClientSubviewPresenterProtocol {
    weak var view: ClientSubviewProtocol?
    // Тут можно объявить модель
    required init(view: ClientSubviewProtocol) {
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
