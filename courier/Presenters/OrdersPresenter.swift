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
    func startTracking()
    func stopTracking()
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
    
    func startTracking() {
      //  locationService.start()
        locationService.trackingWithDelay(seconds: 5)
    }
    
    func stopTracking() {
        locationService.stop()
    }
    
    func startUserActivity() {
        
        api.courierSlotActivityStart(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "") { response in
            self.view?.goToOrderListTableView()
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func checkUserActivity() {
        api.courierSlotActivity(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "") { post in
            if post.status {
                self.view?.goToOrderListTableView()
                self.startTracking()
            }
            else {
                self.stopTracking()
            }

        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
}
