//
//  OrdersPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю в здесь
protocol OrdersViewPresenterProtocol: AnyObject {
    init(view: OrdersViewProtocol)
    func startUserActivity()
    func checkUserActivity()
}

class OrdersPresenter: OrdersViewPresenterProtocol {
    
    weak var view: OrdersViewProtocol?
    // Тут можно объявить модель
    required init(view: OrdersViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    let locationService = LocationService()

    func startUserActivity() {
        api.courierSlotActivityStart() { response in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startSession"), object: nil)
            self.view?.goToOrderListTableView()
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func checkUserActivity() {
        api.courierSlotActivity() { post in
            if post.status {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startSession"), object: nil)
                self.view?.goToOrderListTableView()
            }
            else {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "stopSession"), object: nil)
            }
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
}
