//
//  LoginPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation


protocol LoginViewPresenterProtocol: AnyObject {
    init(view: LoginViewProtocol)
    func buttonTapped(phoneNumber: String?)
}

class LoginPresenter: LoginViewPresenterProtocol {

    weak var view: LoginViewProtocol?

    required init(view: LoginViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func buttonTapped(phoneNumber: String?) {
        
        guard let phoneNumber = phoneNumber else {
            return
        }
        
        var clearPhoneNumber = phoneNumber
        let charsToRemove: Set<Character> = ["(", ")", "-", " "]
        clearPhoneNumber.removeAll(where: { charsToRemove.contains($0) })
        
        api.sendSMS(phoneNumber: clearPhoneNumber) { completion in
            if (200...300).contains(completion.response?.statusCode ?? 0) {
                self.view?.goToConfirmLoginView()
            }
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
}
