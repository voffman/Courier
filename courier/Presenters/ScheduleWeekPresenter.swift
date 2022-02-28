//
//  ScheduleWeekPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 24.02.2022.
//

import Foundation

// То, что выполняю в здесь
protocol ScheduleWeekTableViewPresenterProtocol: AnyObject {
    init(view: ScheduleWeekTableViewProtocol)
    func getScheduleWeek(id: String, completion: @escaping ([ScheduleByIDElement]) -> ())
    func applyStatusById(id: String)
}

class ScheduleWeekPresenter: ScheduleWeekTableViewPresenterProtocol{

    weak var view: ScheduleWeekTableViewProtocol?
    
    let api = ApiService()
    required init(view: ScheduleWeekTableViewProtocol) {
        self.view = view
    }
    
    func getScheduleWeek(id: String, completion: @escaping ([ScheduleByIDElement]) -> ()) {
        api.getCourierScheduleById(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer)!, id: id) { posts in
            completion(posts)
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }

    }
    
    func applyStatusById(id: String) {
        api.scheduleApplyStatus(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer)!, id: id) { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
}
