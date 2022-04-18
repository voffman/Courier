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
}

class LoginPresenter: LoginViewPresenterProtocol {

    weak var view: LoginViewProtocol?
    // Тут можно объявить модель
    required init(view: LoginViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func sendSMS(phoneNumber: String?) {
        
        guard let phoneNumber = phoneNumber else {
            return
        }
        
        var clearPhoneNumber = phoneNumber
        let charsToRemove: Set<Character> = ["(", ")", "-", " "]
        clearPhoneNumber.removeAll(where: { charsToRemove.contains($0) })
        
        if api.isConnectedToInternet {
            api.sendSMS(phoneNumber: clearPhoneNumber) { completion in
                if (200...300).contains(completion.response?.statusCode ?? 0) {
                    self.view?.goToConfirmLoginView()
                }
                
            } errorResponse: { error in
                self.view?.showErrorView(errorResponseData: error)
            }
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
            
        }
    }
}
