//
//  TabBarPresenter.swift
//  courier
//
//  Created by Владимир Свиридов on 18.02.2022.
//

import Foundation

// То, что выполняю в здесь
protocol TabBarPresenterProtocol: AnyObject {
    init(view: TabBarProtocol)
    func tabBarIsLoaded()
}

class TabBarPresenter: TabBarPresenterProtocol{
    
    weak var view: TabBarProtocol?
    
    required init(view: TabBarProtocol) {
        self.view = view
    }
    
    let api = ApiService()
    
    func tabBarIsLoaded() {
        api.courierSlotActivity() { post in
            if post.status {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startSession"), object: nil)
                self.view?.checkActivity(isActive: post.status)
            }
            else {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "stopSession"), object: nil)
                self.view?.checkActivity(isActive: post.status)
            }
            
        } errorResponse: { error in
            self.view?.checkActivity(isActive: false)
        }
    }
}
