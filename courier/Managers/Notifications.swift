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
    
    func registerForPushNotifications() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Is permission granted: \(granted)")
            
            guard granted else { return }
            
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
      // распарсиваю userinfo
      // смотрю на action event
      //categoryIdentifier не нужны
      let userInfo = notification.request.content.userInfo
      let actionEvent = userInfo["actionEvent"] as? String ?? "Отсутствует actionEvent"
      
      switch actionEvent {

      case "closeSlot":
          print("close slot")
          notificationsActions.closeSlot()
         break

      case "updateOrder":
          print("update order")
          let userInfo = notification.request.content.userInfo
          notificationsActions.updateOrder(userInfo: userInfo)
         break

      default:
          print("default")
         break
      }
      
      completionHandler([.alert, .sound])
  }
    

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler:
             @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        let actionEvent = userInfo["actionEvent"] as? String ?? "Отсутствует actionEvent"
  
       switch actionEvent {
       case "closeSlot":
           print("close slot by tap")
           notificationsActions.closeSlotByTap()
          break

       case "updateOrder":
           print("update order by tap")
           let userInfo = response.notification.request.content.userInfo
           notificationsActions.updateOrderByTap(userInfo: userInfo)
          break

       default:
           print("default")
          break
       }
        
       completionHandler()
    }
}
