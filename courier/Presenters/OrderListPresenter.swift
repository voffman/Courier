//
//  OrderListPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю во вью
protocol OrderListTableViewProtocol: AnyObject  {
    
}

// То, что выполняю в здесь
protocol OrderListTableViewPresenterProtocol: AnyObject {
    init(view: OrderListTableViewProtocol)
    func getOrders()
}

class OrderListPresenter: OrderListTableViewPresenterProtocol {
    weak var view: OrderListTableViewProtocol?
    // Тут можно объявить модель
    required init(view: OrderListTableViewProtocol) {
        self.view = view
    }
    
    
    func getOrders() {
        
    }

}