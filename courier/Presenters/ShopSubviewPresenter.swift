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
}

// То, что выполняю в здесь
protocol ShopSubviewPresenterProtocol: AnyObject {
    func getSelectedShopData()
}

class ShopSubviewPresenter: ShopSubviewPresenterProtocol {
    
    weak var view: ShopSubviewProtocol?
    // Тут можно объявить модель
    func getSelectedShopData() {
        
    }
    
}
