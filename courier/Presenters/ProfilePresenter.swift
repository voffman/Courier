//
//  ProfilePresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 11.03.2022.
//

import Foundation

protocol ProfileViewPresenterProtocol: AnyObject {
    init(view: ProfileViewProtocol)
    func getEmployeeData(completion: @escaping (EmployeeResponse) -> ())
    func sessionStop()
}

class ProfilePresenter: ProfileViewPresenterProtocol {

    weak var view: ProfileViewProtocol?
    // Тут можно объявить модель
    required init(view: ProfileViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
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
    
    func sessionStop() {
        api.courierSlotActivityStop(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "") { response in
            self.view?.goToLoginView()
            self.removeBearer()
            
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
}
