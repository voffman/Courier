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
   // func sessionStopAndGoToLoginView()
    func checkUserActivity(completion: @escaping (CourierSlotResponse) -> ())
    func getDefaultNavigatorValue()->String
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
        
        api.getEmployeeData(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "") { posts in
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
        api.courierSlotActivityStart(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "") { response in
            print("Сессия запущена")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "userActivity"), object: nil)
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    
    func sessionStop() {
        api.courierSlotActivityStop(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "") { response in
            print("Сессия остановлена")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "userActivityStop"), object: nil)
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func checkUserActivity(completion: @escaping (CourierSlotResponse) -> ()) {
        api.courierSlotActivity(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "") { post in
            completion(post)

        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
    
    func getDefaultNavigatorValue() -> String {
        print("навигатор: \(UserDefaults.standard.string(forKey: UserDefaultsKeys.defaultNavigator) ?? "")")
        return UserDefaults.standard.string(forKey: UserDefaultsKeys.defaultNavigator) ?? ""
    }
    
//    func sessionStopAndGoToLoginView() {
//        api.courierSlotActivityStop(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "") { response in
//            self.view?.goToLoginView()
//            self.removeBearer()
//
//        } errorResponse: { error in
//            self.view?.showErrorView(errorResponseData: error)
//        }
//    }
}
