//
//  SchedulePresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 24.02.2022.
//

import Foundation

protocol ScheduleTableViewPresenterProtocol: AnyObject {
    init(view: ScheduleTableViewProtocol)
    func viewWillAppear(page: String)
    func didTap (model: ScheduleElement)
}

class SchedulePresenter: ScheduleTableViewPresenterProtocol{
    weak var view: ScheduleTableViewProtocol?
    
    required init(view: ScheduleTableViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func viewWillAppear(page: String) {
        api.getCourierSchedule(page: page) { posts in
            self.view?.checkSchedule(posts: posts)
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    public func didTap (model: ScheduleElement){
        self.view?.goToScheduleWeek(scheduleElement: model)
    }
}
