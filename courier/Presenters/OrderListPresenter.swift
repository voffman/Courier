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
    func checkUserActivity(completion: @escaping (CourierSlotResponse) -> ())
}

class OrderListPresenter: OrderListTableViewPresenterProtocol {
    weak var view: OrderListTableViewProtocol?
    // Тут можно объявить модель
    required init(view: OrderListTableViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func getOrders(completion: @escaping ([CourierOrderResponseElement]) -> ()){
        if api.isConnectedToInternet {
            api.getOrders(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? ""){ posts in
                completion(posts)
            } errorResponse: { error in
                self.view?.showErrorView(errorResponseData: error)
            }
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
    }
    
    func getArchiveOrders(completion: @escaping ([CourierOrderResponseElement]) -> ()){
        if api.isConnectedToInternet {
            api.getArchiveOrders(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? ""){ posts in
                completion(posts)
            } errorResponse: { error in
                self.view?.showErrorView(errorResponseData: error)
            }
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
    }
    
    func changeStatus(orderId: String, status: String, completion: @escaping (OrderStatusResponse) -> ()) {
        if api.isConnectedToInternet {
            api.changeOrderStatus(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "", orderId: orderId, status: status) { post in
                completion(post)
            } errorResponse: { error in
                self.view?.showErrorView(errorResponseData: error)
            }
            
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
    }
    
    public func didTap (model: CourierOrderResponseElement){

        self.view?.goToDetailOrderTableView(courierOrderResponseElement: model)

    }
    
    public func didStatusTap (model: CourierOrderResponseElement){

        self.view?.showStatusAlert(courierOrderResponseElement: model)

    }
    
    func checkUserActivity(completion: @escaping (CourierSlotResponse) -> ()) {
        if api.isConnectedToInternet {
            api.courierSlotActivity(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "") { post in
                completion(post)
                
            } errorResponse: { error in
                self.view?.showErrorView(errorResponseData: error)
            }
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
    }
    
}
