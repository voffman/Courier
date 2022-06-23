//
//  ConfirmLoginPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

protocol ConfirmLoginViewPresenterProtocol: AnyObject {
    init(view: ConfirmLoginViewProtocol)
    func confirmButtonTapped(phoneNumber: String, smsCode: String)
    func sendAgainButtonTapped(phoneNumber: String?)

}

class ConfirmLoginPresenter: ConfirmLoginViewPresenterProtocol {
    weak var view: ConfirmLoginViewProtocol?

    required init(view: ConfirmLoginViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()

    func confirmButtonTapped(phoneNumber: String, smsCode: String) {
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
    }
    
    func sendAgainButtonTapped(phoneNumber: String?) {
        
        guard let phoneNumber = phoneNumber else {
            return
        }
        
        var clearPhoneNumber = phoneNumber
        let charsToRemove: Set<Character> = ["(", ")", "-", " "]
        clearPhoneNumber.removeAll(where: { charsToRemove.contains($0) })
        
        api.sendSMS(phoneNumber: clearPhoneNumber) { completion in
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
        
    }
}
