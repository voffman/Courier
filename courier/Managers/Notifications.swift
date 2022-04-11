//
//  Notifications.swift
//  courier
//
//  Created by Владимир Свиридов on 11.04.2022.
//

import Foundation
import UIKit
import UserNotifications

class Notifications: NSObject, UNUserNotificationCenterDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()

    func getNotificationSettings() {
        notificationCenter.getNotificationSettings { settings in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func setNotificationsCategories() {
        // 1
        let slotAction = UNNotificationAction(identifier: "stopSessionAction",
                                              title: "Закрыть сессию",
                                              options: [])
        
        // 2
        let slotCategory = UNNotificationCategory(identifier: "closeSlot",
                                                  actions: [slotAction],
                                                  intentIdentifiers: [],
                                                  options: [])
          
        let orderAction = UNNotificationAction(identifier: "changeStatusAction",
                                                title: "Сменить статус",
                                                options: [])
          
          
        let orderCategory = UNNotificationCategory(identifier: "updateOrder",
                                                    actions: [orderAction],
                                                    intentIdentifiers: [],
                                                    options: [])
        // 3
        notificationCenter.setNotificationCategories([slotCategory, orderCategory])
    }
    
    func registerForPushNotifications() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Is permission granted: \(granted)")
            
            guard granted else { return }
            
            self.setNotificationsCategories()
            
            self.getNotificationSettings()
        }
    }
    
    
    func getRegisterStatusForPushNotifications() {
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: { settings in
            switch settings.authorizationStatus {
            case .authorized, .provisional:
                print("Пользователь согласился получать уведомления")
            case .denied:
                print("Пользователь отказался получать уведомления")
            case .notDetermined:
                print("Разрешение не определено")
            default:
                print("Default")
            }
        })
    }
    
}

extension AppDelegate: UNUserNotificationCenterDelegate{
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      let tokenParts = deviceToken.map { data -> String in
        return String(format: "%02.2hhx", data)
      }
      
      let token = tokenParts.joined()
      print("Device Token: \(token)")
    }

    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
      print("Failed to register: \(error)")
    }
    
    func application( _ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any],
      fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

    }
    
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
      completionHandler([.alert, .sound])
  }
    

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler:
             @escaping () -> Void) {
        
       switch response.actionIdentifier {
       case "stopSessionAction":
       // NotificationCenter.default.post(name: NSNotification.Name(rawValue: "userActivityStop"), object: nil)
          print("stopSessionAction")
          break
            
       case "changeStatusAction":
          print("changeStatusAction")
          break
            
       default:
           print("default")
          break
       }
        
       completionHandler()
    }
}
