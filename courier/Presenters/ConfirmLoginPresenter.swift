//
//  ConfirmLoginPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю в здесь
protocol ConfirmLoginViewPresenterProtocol: AnyObject {
    init(view: ConfirmLoginViewProtocol)
    func requestAuthKey(phoneNumber: String, smsCode: String)
    func sendSMS(phoneNumber: String?)

}

class ConfirmLoginPresenter: ConfirmLoginViewPresenterProtocol {
    weak var view: ConfirmLoginViewProtocol?
    // Тут можно объявить модель
    required init(view: ConfirmLoginViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()

    func requestAuthKey(phoneNumber: String, smsCode: String) {
        if api.isConnectedToInternet {
        api.getAuthKey( phoneNumber: phoneNumber, smsCode: smsCode){ bearer in
            UserDefaults.standard.set(bearer, forKey: UserDefaultsKeys.bearer)
            if UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) != ""{
                self.view?.goToOrdersViewTabBar()
            }
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
    }
    
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
                self.view?.showErrorView(errorResponseData: errorResponse)
            }
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
    }
}
