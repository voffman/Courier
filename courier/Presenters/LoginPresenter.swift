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
    func toLogin()
}

class LoginPresenter: LoginViewPresenterProtocol {
    
    weak var view: LoginViewProtocol?
    // Тут можно объявить модель
    
    func toLogin() {
        print("Login")
    }
}
 
