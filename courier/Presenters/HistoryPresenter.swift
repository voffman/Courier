//
//  HistoryPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 10.03.2022.
//

import Foundation


protocol HistoryTableViewPresenterProtocol: AnyObject {
    init(view: HistoryTableViewProtocol)
    func viewNeedsUpdateData(dateStart: String, dateFinish: String)
}

class HistoryPresenter: HistoryTableViewPresenterProtocol {
   
    weak var view: HistoryTableViewProtocol?
    // Тут можно объявить модель
    
    required init(view: HistoryTableViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func viewNeedsUpdateData(dateStart: String, dateFinish: String) {
        api.getCourierHistory(dateStart: dateStart, dateFinish: dateFinish) { posts in
            self.view?.checkHistory(posts: posts)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
}
