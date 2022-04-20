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
            api.getAuthKey( phoneNumber: phoneNumber, smsCode: smsCode){ posts in
                
                for post in posts {
                    UserDefaults.standard.set(post.authKey, forKey: UserDefaultsKeys.bearer)
                    if UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) != nil{
                        self.view?.goToOrdersViewTabBar()
                    } else {
                        self.view?.showMessage(title: "Внимание", message: "Неправильный код")
                    }
                }
                
            } errorResponse: { error in
                self.view?.showErrorView(errorResponseData: error)
            }
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
    }
    
    func sendSMS(phoneNumber: String?) {
        
        guard let phoneNumber = phoneNumber else {
            return
        }
        
        var clearPhoneNumber = phoneNumber
        let charsToRemove: Set<Character> = ["(", ")", "-", " "]
        clearPhoneNumber.removeAll(where: { charsToRemove.contains($0) })
        if api.isConnectedToInternet {
            api.sendSMS(phoneNumber: clearPhoneNumber) { completion in
            } errorResponse: { error in
                self.view?.showErrorView(errorResponseData: error)
            }
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
            
        }
    }
}
