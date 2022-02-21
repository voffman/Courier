//
//  OrderListPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation
import UIKit

// То, что выполняю во вью
protocol OrderListTableViewProtocol: AnyObject  {
    func showErrorView(error: ErrorResponse)
    func checkOrders()
}

// То, что выполняю в здесь
protocol OrderListTableViewPresenterProtocol: AnyObject {
    init(view: OrderListTableViewProtocol)
    func getOrders(viewController: UIViewController, completion: @escaping ([CourierOrderResponseElement]) -> ())
}

class OrderListPresenter: OrderListTableViewPresenterProtocol {
    weak var view: OrderListTableViewProtocol?
    // Тут можно объявить модель
    let networkManager = NetworkManager()
    let api = ApiService()
    required init(view: OrderListTableViewProtocol) {
        self.view = view
    }
    
    
    func getOrders(viewController: UIViewController,completion: @escaping ([CourierOrderResponseElement]) -> ()){
        
        api.getOrders() { posts in
            completion(posts)
        } errorResponse: { error in
            self.view?.showErrorView(error: error)
        }
    }
}
