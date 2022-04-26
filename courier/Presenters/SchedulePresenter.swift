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
    func getSchedule(page: String)
    func didTap (model: ScheduleElement)
}

class SchedulePresenter: ScheduleTableViewPresenterProtocol{
    weak var view: ScheduleTableViewProtocol?
    
    required init(view: ScheduleTableViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func getSchedule(page: String) {
        if api.isConnectedToInternet {
            api.getCourierSchedule(page: page) { posts in
                self.view?.isHaveSchedule(posts: posts)
                
            } errorResponse: { error in
                self.view?.showErrorView(errorResponseData: error)
            }
            
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
    }
    public func didTap (model: ScheduleElement){
        self.view?.goToScheduleWeek(scheduleElement: model)
    }
}
