//
//  TabBarPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 18.02.2022.
//

import Foundation

// То, что выполняю во вью
protocol TabBarProtocol: AnyObject  {
    func reloadMainItem()
}

// То, что выполняю в здесь
protocol TabBarPresenterProtocol: AnyObject {
    init(view: TabBarProtocol)
    func checkActivity() -> Bool
}

class TabBarPresenter: TabBarPresenterProtocol{
    
    weak var view: TabBarProtocol?
    
    required init(view: TabBarProtocol) {
        self.view = view
    }
    
    func checkActivity() -> Bool {
        if UserDefaults.standard.string(forKey: UserDefaultsKeys.courierActivity) == "active"{
            return true
            self.view?.reloadMainItem()
        }
        else{
            return false
        }
    }
    
    
    
}
