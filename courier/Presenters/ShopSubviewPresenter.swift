//
//  ShopSubviewPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation


// То, что выполняю во вью
protocol ShopSubviewProtocol: AnyObject  {
    func configure(source: String?, address: String?)
    func openApp(appURL: URL)

}

// То, что выполняю в здесь
protocol ShopSubviewPresenterProtocol: AnyObject {
    init(view: ShopSubviewProtocol)
    func getSelectedShopData()
    func getCoordinates()
    func getPhoneNumber()
}

class ShopSubviewPresenter: ShopSubviewPresenterProtocol {
    weak var view: ShopSubviewProtocol?
    
    required init(view: ShopSubviewProtocol) {
        self.view = view
    }

    func getSelectedShopData() {
        
    }
    
    func getCoordinates(){
        // получить координаты пользователя и заведения
        let to = Coordinates(latitude: 49.820024, longitude: 73.103696)
        let urlString = "http://maps.apple.com/maps?daddr=\(to.latitude),\(to.longitude)"
        
        let url = URL(string: urlString)
        view?.openApp(appURL: url!)
         
    }
    
    func getPhoneNumber() {
        let phoneNumber = "+1(222)333-44-55"
        
        let urlString = "tel://" + phoneNumber
        
        let url = URL(string: urlString)
        view?.openApp(appURL: url!)
    }
}
