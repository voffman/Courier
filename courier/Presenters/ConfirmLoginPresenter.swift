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
    func confirmSMSCode()
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
    
    func confirmSMSCode() {
        api.getAuthKey { bearer in
            UserDefaults.standard.set(bearer, forKey: UserDefaultsKeys.bearer)
            if UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) != ""{
                self.view?.openOrdersView()
            }
        }
    }
}
