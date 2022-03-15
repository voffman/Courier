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
    func getSelectedShopData()
    func getCoordinates(latitude: String, longitude: String)
    func getPhoneNumber(phoneNumber: String)
}

class ShopSubviewPresenter: ShopSubviewPresenterProtocol {
    weak var view: ShopSubviewProtocol?
    
    required init(view: ShopSubviewProtocol) {
        self.view = view
    }

    func getSelectedShopData() {
        
    }
    
    func getCoordinates(latitude: String, longitude: String){
        
        let urlString = "http://maps.apple.com/maps?daddr=\(latitude),\(longitude)"
        
        let url = URL(string: urlString)
        view?.openApp(appURL: url!)
         
    }
    
    func getPhoneNumber(phoneNumber: String) {
        let urlString = "tel://" + phoneNumber
        let url = URL(string: urlString)
        
        view?.openApp(appURL: url!)
    }
}
