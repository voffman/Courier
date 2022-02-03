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
    func toLogin()
}

class LoginPresenter: LoginViewPresenterProtocol {
    weak var view: LoginViewProtocol?
    // Тут можно объявить модель
    required init(view: LoginViewProtocol) {
        self.view = view
    }
    
    func toLogin() {
        print("Login presenred is done")
    }
}
 
