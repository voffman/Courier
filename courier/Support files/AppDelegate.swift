//
//  AppDelegate.swift
//  courier
//
//  Created by Владимир Свиридов on 18.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let notifications = Notifications()
    let notificationsActions = NotificationsActions()
    let locationService = LocationService()
    
    @objc func startTracking() {
        print("Старт трэкинг")
        locationService.trackingWithDelay(seconds: 30)
    }
    
    @objc func stopTracking() {
        locationService.stop()
    }
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        
        let bearer = UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer)
        
        if bearer != nil, bearer != "" {
            window?.rootViewController = TabBarController()
        }
        else {
            window?.rootViewController = LoginView()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(startTracking), name: NSNotification.Name(rawValue: "userActivityStartTracking"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(stopTracking), name: NSNotification.Name(rawValue: "userActivityStopTracking"), object: nil)
        

        notifications.registerForPushNotifications()
        notifications.getRegisterStatusForPushNotifications()
        notifications.notificationCenter.delegate = self // требует extention
        
        window?.makeKeyAndVisible()
    
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
            
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    
    func applicationWillEnterForeground(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        //stopTracking()
    }
    

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

