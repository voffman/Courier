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
        
        api.courierSlotActivityStart(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "") { response in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "userActivity"), object: nil)
            self.view?.goToOrderListTableView()
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func checkUserActivity() {
        api.courierSlotActivity(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "") { post in
            if post.status {
                self.view?.goToOrderListTableView()
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "userActivity"), object: nil)
            }
            else {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "userActivityStop"), object: nil)
            }

        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
}
