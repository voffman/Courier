//
//  NotificationsActions.swift
//  courier
//
//  Created by Владимир Свиридов on 12.04.2022.
//

import Foundation
import UIKit

class NotificationsActions: MVPController {
    let api = ApiService()
    
    func closeSlot() {
        api.courierSlotActivityStop() { response in
            print("Сессия остановлена")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "userActivityStopTracking"), object: nil)
            
        } errorResponse: { error in
            print("ошибка приостановки пользоваетльской сессиии: \(error)")
        }
    }
    
    
    func closeSlotByTap() {
     //   closeSlot()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "closeSlotByTap"), object: nil)
    }
    
    func updateOrderByTap(userInfo: [AnyHashable : Any]) {
        let dict: [AnyHashable: Any] = userInfo["actionData"] as! [AnyHashable : Any]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateOrderByTap"), object: nil, userInfo: dict)
    }
    
    func updateOrder(userInfo: [AnyHashable : Any]) {
        let dict: [AnyHashable: Any] = userInfo["actionData"] as! [AnyHashable : Any]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateOrder"), object: nil, userInfo: dict)
    }
}
