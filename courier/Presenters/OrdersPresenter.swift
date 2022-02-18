//
//  OrdersPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю во вью
protocol OrdersViewProtocol: AnyObject  {
    
}

// То, что выполняю в здесь
protocol OrdersViewPresenterProtocol: AnyObject {
    init(view: OrdersViewProtocol)
    func startUserActivity()
    
}

class OrdersPresenter: OrdersViewPresenterProtocol {
    
    weak var view: OrdersViewProtocol?
    // Тут можно объявить модель
    required init(view: OrdersViewProtocol) {
        self.view = view
    }
    
    func startUserActivity() {
        UserDefaults.standard.set("active", forKey: UserDefaultsKeys.courierActivity)
    }
    
}
