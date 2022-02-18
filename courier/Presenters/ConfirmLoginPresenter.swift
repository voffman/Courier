//
//  ConfirmLoginPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю во вью
protocol ConfirmLoginViewProtocol: AnyObject  {
    func openOrdersView()
}

// То, что выполняю в здесь
protocol ConfirmLoginViewPresenterProtocol: AnyObject {
    init(view: ConfirmLoginViewProtocol)
    func sendSMSAgain()
    func requestAuthKey()
    func returnPhoneNumber() -> String
    func setSMSCode(code: String)
}

class ConfirmLoginPresenter: ConfirmLoginViewPresenterProtocol {
    weak var view: ConfirmLoginViewProtocol?
    // Тут можно объявить модель
    required init(view: ConfirmLoginViewProtocol) {
        self.view = view
    }
    let api = ApiService()
    
    func sendSMSAgain() {
        api.sendSMS() //77012559804

    }
    
    func requestAuthKey() {
        api.getAuthKey { bearer in
            UserDefaults.standard.set(bearer, forKey: UserDefaultsKeys.bearer)
            if UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) != ""{
                self.view?.openOrdersView()
            }
        }
    }
    
    func returnPhoneNumber() -> String {
        return UserDefaults.standard.string(forKey: UserDefaultsKeys.phoneNumber) ?? "Нет данных"
    }
    
    func setSMSCode(code: String){
        UserDefaults.standard.set(code, forKey: UserDefaultsKeys.smsCode)
    }
}
