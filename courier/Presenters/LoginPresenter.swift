//
//  LoginPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation
//import UIKit

// То, что выполняю во вью
protocol LoginViewProtocol: AnyObject  {
    func showErrorView(error: ErrorResponse)
    
}

// То, что выполняю в здесь
protocol LoginViewPresenterProtocol: AnyObject {
    init(view: LoginViewProtocol)
    func sendSMS(phoneNumber: String?)
}

class LoginPresenter: LoginViewPresenterProtocol {
    
    weak var view: LoginViewProtocol?
    // Тут можно объявить модель
    required init(view: LoginViewProtocol) {
        self.view = view
    }
    
    
    func sendSMS(phoneNumber: String?) {
        // Здесь выпоняется запрос по получению "СМС"
        // Api.getLogin
        // две функции для обработки успеха или ошибки
        
        var errorResponse: ErrorResponse?
        
        guard let phoneNumber = phoneNumber else {
            return
        }

        UserDefaults.standard.set(phoneNumber, forKey: UserDefaultsKeys.phoneNumber)
        let api = ApiService()
        api.sendSMS { error in
            errorResponse = error
            guard let errorResponse = errorResponse else {
                return
            }
            self.view?.showErrorView(error: errorResponse)
        }
    }
}
