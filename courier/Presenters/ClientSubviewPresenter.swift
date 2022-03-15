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
    func getSelectedClientData()
    func getCoordinates(latitude: String, longitude: String)
    func getPhoneNumber(phoneNumber: String)
}

class ClientSubviewPresenter: ClientSubviewPresenterProtocol {
    weak var view: ClientSubviewProtocol?
    // Тут можно объявить модель
    required init(view: ClientSubviewProtocol) {
        self.view = view
    }
    
    func getSelectedClientData() {
        
    }
    
    func getCoordinates(latitude: String, longitude: String){
        // получить координаты пользователя и заведения
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
