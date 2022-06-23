//
//  DetailOrderPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

protocol DetailOrderTableViewPresenterProtocol: AnyObject {
    init(view: DetailOrderTableViewProtocol)
    func sendAlertButtonTapped(orderId: String, status: String, completion: @escaping (OrderStatusResponse) -> ())
}

class DetailOrderPresenter: DetailOrderTableViewPresenterProtocol {
    weak var view: DetailOrderTableViewProtocol?

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
