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
    func checkOrders(completion: @escaping ([CourierOrderResponseElement]) -> ())
}

class OrdersPresenter: OrdersViewPresenterProtocol {
    weak var view: OrdersViewProtocol?
    // Тут можно объявить модель
    required init(view: OrdersViewProtocol) {
        self.view = view
    }
    
    let networkManager = NetworkManager()
    
    func checkOrders(completion: @escaping ([CourierOrderResponseElement]) -> ()){
        
        networkManager.getRequest(url: URLs.CourierOrders.order, headers: [.authorization(bearerToken: Properties.bearer!)], model: CourierOrderResponseElement.self) { posts in
        
            completion(posts)
        }
        
    }

}
