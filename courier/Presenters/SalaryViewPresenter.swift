//
//  IncomeViewPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 22.04.2022.
//

import Foundation

// То, что выполняю в здесь
protocol SalaryViewPresenterProtocol: AnyObject {
    init(view: SalaryViewProtocol)
    func getInfo(dateStart: String, dateEnd: String)
}


class SalaryPresenter: SalaryViewPresenterProtocol {
    
    weak var view: SalaryViewProtocol?
    // Тут можно объявить модель
    required init(view: SalaryViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func getInfo(dateStart: String, dateEnd: String) {
        api.getSalary(dateStart: dateStart, dateEnd: dateEnd) { post in
            self.view?.configureData(salary: post)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
}
