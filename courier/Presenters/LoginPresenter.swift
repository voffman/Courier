//
//  LoginPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю во вью
protocol LoginViewProtocol: AnyObject  {
}

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
    
    
    func sendSMS(phoneNumber: String?) {
        // Здесь выпоняется запрос по получению "СМС"
        // Api.getLogin
        // две функции для обработки успеха или ошибки
        guard let phoneNumber = phoneNumber else {
            return
        }

        UserDefaults.standard.set(phoneNumber, forKey: UserDefaultsKeys.phoneNumber)
        let api = ApiService()
        api.sendSMS()
        
       // nv.postRequest(url: URLs.Auth.getSMS, headers: [], body: ["phone": Properties.phoneNumber]) //77012559804
       //     print("Номер телефона: ", Properties.phoneNumber)

       
    }
}
