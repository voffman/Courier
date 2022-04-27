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
    func getOrders()
    func getArchiveOrders()
    func changeStatus(orderId: String, status: String, completion: @escaping (OrderStatusResponse) -> ())
    func didTap (model: CourierOrderResponseElement)
    func didStatusTap (model: CourierOrderResponseElement)
    func checkUserActivity()
}

class OrderListPresenter: OrderListTableViewPresenterProtocol {
    weak var view: OrderListTableViewProtocol?
    // Тут можно объявить модель
    required init(view: OrderListTableViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func getOrders(){
        api.getOrders(){ posts in
            self.view?.isHaveOrders(posts: posts)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func getArchiveOrders(){
        api.getArchiveOrders(){ posts in
            self.view?.isHaveArchiveOrders(posts: posts)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func changeStatus(orderId: String, status: String, completion: @escaping (OrderStatusResponse) -> ()) {
        api.changeOrderStatus(orderId: orderId, status: status) { post in
            completion(post)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    public func didTap (model: CourierOrderResponseElement){
        
        self.view?.goToDetailOrderTableView(courierOrderResponseElement: model)
        
    }
    
    public func didStatusTap (model: CourierOrderResponseElement){
        
        self.view?.showStatusAlert(courierOrderResponseElement: model)
        
    }
    
    func checkUserActivity() {
        api.courierSlotActivity() { post in
            if post.status {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startSession"), object: nil)
            }
            else {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "stopSession"), object: nil)
            }
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
}
