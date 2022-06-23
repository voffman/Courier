//
//  OrdersPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation


protocol OrdersViewPresenterProtocol: AnyObject {
    init(view: OrdersViewProtocol)
    func sendAlertButtonTapped()
    func viewWillAppear()
}

class OrdersPresenter: OrdersViewPresenterProtocol {
    
    weak var view: OrdersViewProtocol?

    required init(view: OrdersViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    let locationService = LocationService()

    func sendAlertButtonTapped() {
        api.courierSlotActivityStart() { response in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startSession"), object: nil)
            self.view?.goToOrderListTableView()
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func viewWillAppear() {
        api.courierSlotActivity() { post in
            if post.status ?? false {
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
