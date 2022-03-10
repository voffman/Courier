//
//  OrderListPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю в здесь
protocol OrderListTableViewPresenterProtocol: AnyObject {
    init(view: OrderListTableViewProtocol)
    func getOrders( completion: @escaping ([CourierOrderResponseElement]) -> ())
    func getArchiveOrders(completion: @escaping ([CourierOrderResponseElement]) -> ())
}

class OrderListPresenter: OrderListTableViewPresenterProtocol {
    weak var view: OrderListTableViewProtocol?
    // Тут можно объявить модель
    required init(view: OrderListTableViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func getOrders(completion: @escaping ([CourierOrderResponseElement]) -> ()){
        
        api.getOrders(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer)!){ posts in
            completion(posts)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func getArchiveOrders(completion: @escaping ([CourierOrderResponseElement]) -> ()){
        
        api.getArchiveOrders(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer)!){ posts in
            completion(posts)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
}
