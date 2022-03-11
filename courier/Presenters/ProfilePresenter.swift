//
//  ProfilePresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 11.03.2022.
//

import Foundation

protocol ProfileViewPresenterProtocol: AnyObject {
    init(view: ProfileViewProtocol)
    func goToLoginView()
    func removeBearer()
    func sessionStop(completion: @escaping ([CourierSlotResponse]) -> ())
}

class ProfilePresenter: ProfileViewPresenterProtocol {

    weak var view: ProfileViewProtocol?
    // Тут можно объявить модель
    required init(view: ProfileViewProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func goToLoginView() {
        self.view?.goToLoginView()
    }
    
    func removeBearer() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.bearer)
        
//        if let appDomain = Bundle.main.bundleIdentifier {
//        UserDefaults.standard.removePersistentDomain(forName: appDomain)
//         }
    }
    
    func sessionStop(completion: @escaping ([CourierSlotResponse]) -> ()) {
        api.courierSlotActivityStop(token: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer)!) { posts in
            completion(posts)
        } errorResponse: { error in
            self.view?.showErrorView(errorResponseData: error)
        }
    }
}
