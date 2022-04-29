//
//  ChooseNavigatorPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 04.04.2022.
//

import Foundation


// То, что выполняю в здесь
protocol ChooseNavigatorPresenterProtocol: AnyObject {
    init(view: ChooseNavigatorViewProtocol)
    func gisButtonTapped()
    func yaNavButtonTapped()
}

class ChooseNavigatorPresenter: ChooseNavigatorPresenterProtocol {

    weak var view: ChooseNavigatorViewProtocol?
    // Тут можно объявить модель
    required init(view: ChooseNavigatorViewProtocol) {
        self.view = view
    }
    
    func gisButtonTapped() {
        UserDefaults.standard.set(Navigators.doubleGIS, forKey: UserDefaultsKeys.defaultNavigator)
    }
    
    func yaNavButtonTapped() {
        UserDefaults.standard.set(Navigators.yandex, forKey: UserDefaultsKeys.defaultNavigator)
    }

}
