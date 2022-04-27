//
//  ProfilePresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 11.03.2022.
//

import Foundation

protocol ProfileViewPresenterProtocol: AnyObject {
    init(view: ProfileViewProtocol)
    func removeBearer()
    func getEmployeeData(completion: @escaping (EmployeeResponse) -> ())
    func sessionStart()
    func sessionStop()
    func checkUserActivity()
    func returnDefaultNavigatorValue()->String
}

class ProfilePresenter: ProfileViewPresenterProtocol {

    weak var view: ProfileViewProtocol?
    // Тут можно объявить модель
    required init(view: ProfileViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    let locationService = LocationService()
    
    func getEmployeeData(completion: @escaping (EmployeeResponse) -> ()) {
        api.getEmployeeData() { posts in
            completion(posts)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func removeBearer() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.bearer)
        
//        if let appDomain = Bundle.main.bundleIdentifier {
//        UserDefaults.standard.removePersistentDomain(forName: appDomain)
//         }
    }
    
    func sessionStart() {
        api.courierSlotActivityStart() { response in
            print("Сессия запущена")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startSession"), object: nil)
            // NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startSession"), object: nil)
            self.checkUserActivity()
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
            self.checkUserActivity()
        }
    }
    
    
    func sessionStop() {
        api.courierSlotActivityStop() { response in
            print("Сессия остановлена")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "stopSession"), object: nil)
            self.checkUserActivity()
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
            self.checkUserActivity()
        }
    }
    
    func checkUserActivity() {
        api.courierSlotActivity() { post in
            self.view?.updateSessionStatus(post: post)
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func returnDefaultNavigatorValue() -> String {
        print("навигатор: \(UserDefaults.standard.string(forKey: UserDefaultsKeys.defaultNavigator) ?? "")")
        return UserDefaults.standard.string(forKey: UserDefaultsKeys.defaultNavigator) ?? "2ГИС"
    }
    
}
