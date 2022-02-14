//
//  OrderListPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю во вью
protocol OrderListTableViewProtocol: AnyObject  {
  //MARK: перенести сюда функцию конфигуреCELL в tableView func configure(...) Не получится, это внутрення функция ячейки
    func checkOrders()
}

// То, что выполняю в здесь
protocol OrderListTableViewPresenterProtocol: AnyObject {
    init(view: OrderListTableViewProtocol)
    func getOrders(completion: @escaping ([CourierOrderResponseElement]) -> ())
}

class OrderListPresenter: OrderListTableViewPresenterProtocol {
    weak var view: OrderListTableViewProtocol?
    // Тут можно объявить модель
    let networkManager = NetworkManager()
    
    required init(view: OrderListTableViewProtocol) {
        self.view = view
    }
    
    
    func getOrders(completion: @escaping ([CourierOrderResponseElement]) -> ()){
        
        networkManager.getRequest(url: URLs.CourierOrders.order, headers: [.authorization(bearerToken: Properties.bearer!)], model: CourierOrderResponseElement.self) { posts in
            completion(posts)
        }
    }
}
