//
//  MVPControllerPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 16.02.2022.
//

import Foundation

protocol MVPControllerProtocol: AnyObject  {
    
}

// То, что выполняю в здесь
protocol MVPControllerPresenterProtocol: AnyObject {
    init(view: MVPControllerProtocol)

}

class MVPControllerPresenter: MVPControllerPresenterProtocol{
    
    weak var mvpController: MVPControllerProtocol?
    // Тут можно объявить модель
    required init(view: MVPControllerProtocol) {
        self.mvpController = view
    }
    
}
