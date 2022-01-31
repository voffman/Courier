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
    func checkOrders()
}

class OrdersPresenter: OrdersViewPresenterProtocol {
    
    weak var view: OrdersViewProtocol?
    // Тут можно объявить модель
    
    func checkOrders() {
        
    }

}
