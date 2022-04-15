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
    func checkUserActivity(completion: @escaping (CourierSlotResponse) -> ())
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
        if api.isConnectedToInternet {
            api.courierSlotActivityStart(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "") { response in
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "userActivityStartTracking"), object: nil)
                self.view?.goToOrderListTableView()
                
            } errorResponse: { error in
                self.view?.showErrorView(errorResponseData: error)
            }
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
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
