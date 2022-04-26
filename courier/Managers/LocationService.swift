//
//  LocationService.swift
//  courier
//
//  Created by Владимир Свиридов on 06.04.2022.
//

import Foundation
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate  {
    
    private let locationManager = CLLocationManager()
    var timer : Timer?
    var isTimerActive = false
    
    var count = 0
//    override init() {
//        super.init()
//        configurate()
//    }
    
    let api = ApiService()
    
    private func configurate() {
        locationManager.delegate = self
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
       // locationManager.distanceFilter = 10
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
    
    @objc func start() {
        requestPermission()
        configurate()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        count += 1
        print("\(count) -й старт таймера")
    }
    
    func stop() {
        locationManager.stopUpdatingLocation()
        locationManager.stopMonitoringSignificantLocationChanges()
        timer?.invalidate()
        isTimerActive = false
        timer = nil
    }
    
    
    func trackingWithDelay(seconds: Double) {
        if isTimerActive {
            print("Таймер уже запущен")
           // timer?.invalidate()
         //   timer = nil
        }
        else {
            timer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(start), userInfo: nil, repeats: true)
            timer?.tolerance = 0.25
            isTimerActive = true

        }
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last {
            print("Широта (latitude)", location.coordinate.latitude)
            print("Долгота (longitude) ", location.coordinate.longitude)

            var errorResponse: ErrorResponse?
            api.saveCourierLocation(latitude: String(location.coordinate.latitude), longitude: String(location.coordinate.longitude)){ error in
                errorResponse = error
                guard let errorResponse = errorResponse else { return }
                print("Ошибка: \(errorResponse)")
            }
//            if #available(iOS 14.0, *) {
//                print("Статус: \(manager.authorizationStatus.rawValue)")
//            } else {
//                // Fallback on earlier versions
//            }
        }
        else {
            print("Широта (latitude) не определена")
            print("Долгота (longitude) не определена")
        }
        
        locationManager.stopUpdatingLocation()
        locationManager.stopMonitoringSignificantLocationChanges()
        locationManager.delegate = nil
    }
}

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      print("\(error.localizedDescription)")
   }
    
