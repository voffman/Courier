//
//  LoginPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю во вью
protocol LoginViewProtocol: AnyObject  {
    func getPhoneNumber(completion: (String)->())
}

// То, что выполняю в здесь
protocol LoginViewPresenterProtocol: AnyObject {
    init(view: LoginViewProtocol)
    func savePhoneNumber()
    func sendSMS()
}

class LoginPresenter: LoginViewPresenterProtocol {
    
    weak var view: LoginViewProtocol?
    // Тут можно объявить модель
    required init(view: LoginViewProtocol) {
        self.view = view
    }
    
    func savePhoneNumber() {
        view?.getPhoneNumber(completion: { phoneNumber in
            Properties.phoneNumber = phoneNumber
        })
    }
    
    func sendSMS() {
        // Здесь выпоняется запрос по получению "СМС"
        let nv = NetworkManager()
        nv.postRequest(url: URLs.Auth.getSMS, headers: [], body: ["phone": Properties.phoneNumber]) //77012559804
            print("Номер телефона: ", Properties.phoneNumber)

    }
}
 
