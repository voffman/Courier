//
//  ConfirmLoginPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 31.01.2022.
//

import Foundation

// То, что выполняю во вью
protocol ConfirmLoginViewProtocol: AnyObject  {
    
}

// То, что выполняю в здесь
protocol ConfirmLoginViewPresenterProtocol: AnyObject {
    init(view: ConfirmLoginViewProtocol)
    func confirmLogin()
}

class ConfirmLoginPresenter: ConfirmLoginViewPresenterProtocol {
    weak var view: ConfirmLoginViewProtocol?
    // Тут можно объявить модель
    required init(view: ConfirmLoginViewProtocol) {
        self.view = view
    }
    
    func confirmLogin() {
        print("Login")
    }
}
