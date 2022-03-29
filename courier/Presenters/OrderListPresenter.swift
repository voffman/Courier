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
    func changeStatus(orderId: String, status: String, completion: @escaping (OrderStatusResponse) -> ())
    func didTap (model: CourierOrderResponseElement)
    func didStatusTap (model: CourierOrderResponseElement)
}

class OrderListPresenter: OrderListTableViewPresenterProtocol {
    weak var view: OrderListTableViewProtocol?
    // Тут можно объявить модель
    required init(view: OrderListTableViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func getOrders(completion: @escaping ([CourierOrderResponseElement]) -> ()){
        
        api.getOrders(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? ""){ posts in
            completion(posts)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func getArchiveOrders(completion: @escaping ([CourierOrderResponseElement]) -> ()){
        
        api.getArchiveOrders(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? ""){ posts in
            completion(posts)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func changeStatus(orderId: String, status: String, completion: @escaping (OrderStatusResponse) -> ()) {
        api.changeOrderStatus(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "", orderId: orderId, status: status) { post in
            completion(post)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }

    }
    
    public func didTap (model: CourierOrderResponseElement){

        self.view?.goToDetailOrderTableView(courierOrderResponseElement: model)

    }
    
    public func didStatusTap (model: CourierOrderResponseElement){

        // не вызывается напрямую так как экшны кпопки
        self.view?.showStatusAlert(courierOrderResponseElement: model)

    }
    
}
