//
//  ClientSubviewPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю во вью
protocol ClientSubviewProtocol: AnyObject  {
    func configure(clientName: String?,
                   clientPhone: String?,
                   address: String?)
    func openApp(appURL: URL)
}

// То, что выполняю в здесь
protocol ClientSubviewPresenterProtocol: AnyObject {
    init(view: ClientSubviewProtocol)
    func getSelectedClientData()
    func getCoordinates()
}

class ClientSubviewPresenter: ClientSubviewPresenterProtocol {
    weak var view: ClientSubviewProtocol?
    // Тут можно объявить модель
    required init(view: ClientSubviewProtocol) {
        self.view = view
    }
    
    func getSelectedClientData() {
        
    }
    
    func getCoordinates(){
        // получить координаты пользователя и заведения
        
        let to = Coordinates(latitude: 37.334886, longitude: -122.008988)
        let urlString = "http://maps.apple.com/maps?daddr=\(to.latitude),\(to.longitude)"
        
        let url = URL(string: urlString)
        view?.openApp(appURL: url!)
         
    }
    
}
