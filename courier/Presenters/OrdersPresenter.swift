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
    
}

class OrdersPresenter: OrdersViewPresenterProtocol {
    
    weak var view: OrdersViewProtocol?
    // Тут можно объявить модель
    required init(view: OrdersViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func startUserActivity() {
        UserDefaults.standard.set("active", forKey: UserDefaultsKeys.courierActivity)
        api.courierSlotActivityStart(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer)!) { posts in
           // self.view?.goToOrderListTableView()
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
        self.view?.goToOrderListTableView()
    }
}
