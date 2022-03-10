//
//  HistoryPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 10.03.2022.
//

import Foundation


protocol HistoryTableViewPresenterProtocol: AnyObject {
    init(view: HistoryTableViewProtocol)
    func getHistory(dateStart: String, dateFinish: String, completion: @escaping ([HistoryElement]) -> ())
}

class HistoryPresenter: HistoryTableViewPresenterProtocol {
   
    weak var view: HistoryTableViewProtocol?
    // Тут можно объявить модель
    
    required init(view: HistoryTableViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func getHistory(dateStart: String, dateFinish: String, completion: @escaping ([HistoryElement]) -> ()) {
        api.getCourierHistory(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer)!, dateStart: dateStart, dateFinish: dateFinish) { posts in
            completion(posts)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }

    }
    
}
