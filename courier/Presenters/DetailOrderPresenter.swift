//
//  DetailOrderPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю в здесь
protocol DetailOrderTableViewPresenterProtocol: AnyObject {
    init(view: DetailOrderTableViewProtocol)
    func sendAlertButtonTapped(orderId: String, status: String, completion: @escaping (OrderStatusResponse) -> ())
}

class DetailOrderPresenter: DetailOrderTableViewPresenterProtocol {
    weak var view: DetailOrderTableViewProtocol?
    // Тут можно объявить модель
    required init(view: DetailOrderTableViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func sendAlertButtonTapped(orderId: String, status: String, completion: @escaping (OrderStatusResponse) -> ()) {
        api.changeOrderStatus(orderId: orderId, status: status) { post in
            completion(post)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
}
