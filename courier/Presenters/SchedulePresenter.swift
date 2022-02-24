//
//  SchedulePresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 24.02.2022.
//

import Foundation

// То, что выполняю в здесь
protocol ScheduleTableViewPresenterProtocol: AnyObject {
    init(view: ScheduleTableViewProtocol)
    func getSchedule(page: String, completion: @escaping ([ScheduleElement]) -> ())
}

class SchedulePresenter: ScheduleTableViewPresenterProtocol{
    weak var view: ScheduleTableViewProtocol?
    
    let api = ApiService()
    required init(view: ScheduleTableViewProtocol) {
        self.view = view
    }
    
    func getSchedule(page: String, completion: @escaping ([ScheduleElement]) -> ()) {
        api.getCourierSchedule(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer)!, page: page) { posts in
            completion(posts)
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }

    }
    
    
}
