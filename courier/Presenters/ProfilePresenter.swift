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
        if api.isConnectedToInternet {
        api.getEmployeeData() { posts in
            completion(posts)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }

        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
    }
    
    func removeBearer() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.bearer)
        
//        if let appDomain = Bundle.main.bundleIdentifier {
//        UserDefaults.standard.removePersistentDomain(forName: appDomain)
//         }
    }
    
    func sessionStart() {
        if api.isConnectedToInternet {
            api.courierSlotActivityStart() { response in
                print("Сессия запущена")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startSession"), object: nil)
                // NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startSession"), object: nil)
                self.checkUserActivity()
            } errorResponse: { error in
                self.view?.showErrorView(errorResponseData: error)
                self.checkUserActivity()
            }
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
    }
    
    
    func sessionStop() {
        if api.isConnectedToInternet {
            api.courierSlotActivityStop() { response in
                print("Сессия остановлена")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "stopSession"), object: nil)
                self.checkUserActivity()
            } errorResponse: { error in
                self.view?.showErrorView(errorResponseData: error)
                self.checkUserActivity()
            }
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
    }
    
    func checkUserActivity() {
        if api.isConnectedToInternet {
            api.courierSlotActivity() { post in
                self.view?.updateSessionStatus(post: post)
                
            } errorResponse: { error in
                self.view?.showErrorView(errorResponseData: error)
            }
        } else {
            view?.showMessage(title: "Внимание", message: "Нет подключения к интернету")
        }
    }
    
    func returnDefaultNavigatorValue() -> String {
        print("навигатор: \(UserDefaults.standard.string(forKey: UserDefaultsKeys.defaultNavigator) ?? "")")
        return UserDefaults.standard.string(forKey: UserDefaultsKeys.defaultNavigator) ?? "2ГИС"
    }
    
}
