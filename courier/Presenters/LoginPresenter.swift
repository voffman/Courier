//
//  LoginPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation


// То, что выполняю в здесь
protocol LoginViewPresenterProtocol: AnyObject {
    init(view: LoginViewProtocol)
    func sendSMS(phoneNumber: String?)
    func goToConfirmLoginView()
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

        // view.shoeErrrorView
        UserDefaults.standard.set(phoneNumber, forKey: UserDefaultsKeys.phoneNumber)
        let api = ApiService()
        api.sendSMS(phoneNumber: phoneNumber) { error in
            errorResponse = error
            guard let errorResponse = errorResponse else { return }
            //
            self.view?.popVC()
            self.view?.showErrorView(errorResponseData: errorResponse)

        }
    }
    
    func goToConfirmLoginView() {
        self.view?.goToConfirmLoginView()
    }
}
