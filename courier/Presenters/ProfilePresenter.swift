//
//  ProfilePresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 11.03.2022.
//

import Foundation

protocol ProfileViewPresenterProtocol: AnyObject {
    init(view: ProfileViewProtocol)
    func viewDidLoad()
    func exitButtonTapped()
    func activityStatusSwitchTurnOn()
    func activityStatusSwitchTurnOff()
    func viewWillAppear()
}

class ProfilePresenter: ProfileViewPresenterProtocol {

    weak var view: ProfileViewProtocol?
    // Тут можно объявить модель
    required init(view: ProfileViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    let locationService = LocationService()
    
    func viewDidLoad() {
        api.getEmployeeData() { post in
            self.view?.configureData(post: post)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func exitButtonTapped() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.bearer)
        NotificationCenter.default.removeObserver(self)
        self.view?.goToLoginView()
//        if let appDomain = Bundle.main.bundleIdentifier {
//        UserDefaults.standard.removePersistentDomain(forName: appDomain)
//         }
    }
    
    func activityStatusSwitchTurnOn() {
        api.courierSlotActivityStart() { response in
            print("Сессия запущена")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startSession"), object: nil)
            // NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startSession"), object: nil)
            self.viewWillAppear()
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
            self.viewWillAppear()
        }
    }
    
    
    func activityStatusSwitchTurnOff() {
        api.courierSlotActivityStop() { response in
            print("Сессия остановлена")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "stopSession"), object: nil)
            self.viewWillAppear()
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
            self.viewWillAppear()
        }
    }
    
    func viewWillAppear() {
        api.courierSlotActivity() { post in
            self.view?.updateSessionStatus(post: post)
            
            let navigator = UserDefaults.standard.string(forKey: UserDefaultsKeys.defaultNavigator) ?? Navigators.doubleGIS
            self.view?.getNavigatorValue(value: navigator)
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
}
