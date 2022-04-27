//
//  HistoryPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 10.03.2022.
//

import Foundation


protocol HistoryTableViewPresenterProtocol: AnyObject {
    init(view: HistoryTableViewProtocol)
    func getHistory(dateStart: String, dateFinish: String)
}

class HistoryPresenter: HistoryTableViewPresenterProtocol {
   
    weak var view: HistoryTableViewProtocol?
    // Тут можно объявить модель
    
    required init(view: HistoryTableViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func getHistory(dateStart: String, dateFinish: String) {
        api.getCourierHistory(dateStart: dateStart, dateFinish: dateFinish) { posts in
            self.view?.isHaveHistory(posts: posts)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
}
