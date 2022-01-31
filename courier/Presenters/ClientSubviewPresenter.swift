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
}

// То, что выполняю в здесь
protocol ClientSubviewPresenterProtocol: AnyObject {
    func getSelectedClientData()
}

class ClientSubviewPresenter: ClientSubviewPresenterProtocol {
    
    weak var view: ClientSubviewProtocol?
    // Тут можно объявить модель
    func getSelectedClientData() {
        
    }
    
}
