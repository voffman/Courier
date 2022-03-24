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
    func goToNextView(error: ErrorResponse)
    
}

class OrdersPresenter: OrdersViewPresenterProtocol {
    
    weak var view: OrdersViewProtocol?
    // Тут можно объявить модель
    required init(view: OrdersViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    var errorResponse: ErrorResponse?
    func startUserActivity() {
        UserDefaults.standard.set("active", forKey: UserDefaultsKeys.courierActivity)
        
        api.courierSlotActivityStart(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer)!) { error in
            self.errorResponse = error
            guard let errorResponse = self.errorResponse else {
                return
            }
        }
        // статус 400
        self.goToNextView(error: errorResponse ?? ErrorResponse(name: "", message: "", code: 0, status: 0, type: ""))

    }
    
    func goToNextView(error: ErrorResponse){
        if error.status == 0 {
            print(error.status, "статус")
            self.view?.goToOrderListTableView()
        } else{
            self.view?.showErrorView(errorResponseData: error)
        }
    }
}
