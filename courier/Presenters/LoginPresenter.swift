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
    
    let api = ApiService()
    
    func sendSMS(phoneNumber: String?) {
        
        var errorResponse: ErrorResponse?
        
        guard let phoneNumber = phoneNumber else {
            return
        }
        
        var clearPhoneNumber = phoneNumber
        let charsToRemove: Set<Character> = ["(", ")", "-", " "]
        clearPhoneNumber.removeAll(where: { charsToRemove.contains($0) })
        
        
        if api.isConnectedToInternet {
            api.sendSMS(phoneNumber: clearPhoneNumber) { error in
                errorResponse = error
                guard let errorResponse = errorResponse else { return }
                //
                self.view?.popVC()
                self.view?.showErrorView(errorResponseData: errorResponse)
                
            }
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
    }
    
    func goToConfirmLoginView() {
        if api.isConnectedToInternet {
        self.view?.goToConfirmLoginView()
        }
    }
}
