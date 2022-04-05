//
//  TabBarPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 18.02.2022.
//

import Foundation

// То, что выполняю во вью
protocol TabBarProtocol: AnyObject  {
    
}

// То, что выполняю в здесь
protocol TabBarPresenterProtocol: AnyObject {
    init(view: TabBarProtocol)
}

class TabBarPresenter: TabBarPresenterProtocol{
    
    weak var view: TabBarProtocol?
    
    required init(view: TabBarProtocol) {
        self.view = view
    }
}
