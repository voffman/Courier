//
//  IncomeViewPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 22.04.2022.
//

import Foundation

// То, что выполняю в здесь
protocol IncomeViewPresenterProtocol: AnyObject {
    init(view: IncomeViewProtocol)
    func getInfo(dateStart: String, dateEnd: String)
}


class SalaryPresenter: IncomeViewPresenterProtocol {
    
    weak var view: IncomeViewProtocol?
    // Тут можно объявить модель
    required init(view: IncomeViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func getInfo(dateStart: String, dateEnd: String) {
        if api.isConnectedToInternet {
            api.getSalary(dateStart: dateStart, dateEnd: dateEnd) { post in
                self.view?.configureData(salary: post)
            } errorResponse: { error in
                self.view?.showErrorView(errorResponseData: error)
            }

        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
    }
    
}
