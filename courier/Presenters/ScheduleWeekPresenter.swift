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
    func getScheduleWeek(id: String)
    func applyStatusById(id: String)
}

class ScheduleWeekPresenter: ScheduleWeekTableViewPresenterProtocol{

    weak var view: ScheduleWeekTableViewProtocol?
    
    required init(view: ScheduleWeekTableViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func getScheduleWeek(id: String) {
            api.getCourierScheduleById(id: id) { posts in
                self.view?.isHaveScheduleWeek(posts: posts)
            } errorResponse: { error in
                self.view?.showErrorView(errorResponseData: error)
            }
    }
    
    func applyStatusById(id: String) {
        api.scheduleApplyStatus(id: id) { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
}
