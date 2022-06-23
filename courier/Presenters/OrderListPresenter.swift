//
//  OrderListPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation


protocol OrderListTableViewPresenterProtocol: AnyObject {
    init(view: OrderListTableViewProtocol)
    func actionOrdersTabIsOpen()
    func archiveOrdersTabIsOpen()
    func orderStateAlertSendButtonTapped(orderId: String, status: String, completion: @escaping (OrderStatusResponse) -> ())
    func didTap (model: CourierOrderResponseElement)
    func didStatusTap (model: CourierOrderResponseElement)
    func viewIsLoaded()
}

class OrderListPresenter: OrderListTableViewPresenterProtocol {
    weak var view: OrderListTableViewProtocol?

    required init(view: OrderListTableViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func actionOrdersTabIsOpen(){
        api.getOrders(){ posts in
            self.view?.checkOrders(posts: posts)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func archiveOrdersTabIsOpen(){
        api.getArchiveOrders(){ posts in
            self.view?.checkArchiveOrders(posts: posts)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func orderStateAlertSendButtonTapped(orderId: String, status: String, completion: @escaping (OrderStatusResponse) -> ()) {
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
    
    func viewIsLoaded() {
        api.courierSlotActivity() { post in
            if post.status ?? false {
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
