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
    func setDefaultNavigatorTo2GIS()
    func setDefaultNavigatorToYandex()
}

class ChooseNavigatorPresenter: ChooseNavigatorPresenterProtocol {

    weak var view: ChooseNavigatorViewProtocol?
    // Тут можно объявить модель
    required init(view: ChooseNavigatorViewProtocol) {
        self.view = view
    }
    
    func setDefaultNavigatorTo2GIS() {
        UserDefaults.standard.set("2ГИС", forKey: UserDefaultsKeys.defaultNavigator)
    }
    
    func setDefaultNavigatorToYandex() {
        UserDefaults.standard.set("Яндекс Навигатор", forKey: UserDefaultsKeys.defaultNavigator)
    }

}
