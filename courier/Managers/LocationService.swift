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
//    override init() {
//        super.init()
//        configurate()
//    }
    
    private func configurate() {
        locationManager.delegate = self
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
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
        
        print("старт 5 сек")
    }
    
    func stop() {
        locationManager.stopUpdatingLocation()
        locationManager.stopMonitoringSignificantLocationChanges()
        timer?.invalidate()
        timer = nil
    }
    
    
    func trackingWithDelay(seconds: Double) {
        timer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(start), userInfo: nil, repeats: true)
        timer?.tolerance = 0.25
        
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last {
            print("Широта (latitude)", location.coordinate.latitude)
            print("Долгота (longitude) ", location.coordinate.longitude)
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
    
