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

    func requestAuthKey() {
        api.getAuthKey( phoneNumber: UserDefaults.standard.string(forKey: UserDefaultsKeys.phoneNumber)!, smsCode: UserDefaults.standard.string(forKey: UserDefaultsKeys.smsCode)!){ bearer in
            UserDefaults.standard.set(bearer, forKey: UserDefaultsKeys.bearer)
            if UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) != ""{
                self.view?.goToOrdersViewTabBar()
            }
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func returnPhoneNumber() -> String {
        return UserDefaults.standard.string(forKey: UserDefaultsKeys.phoneNumber) ?? "Нет данных"
    }
    
    func setSMSCode(code: String){
        UserDefaults.standard.set(code, forKey: UserDefaultsKeys.smsCode)
    }
}
