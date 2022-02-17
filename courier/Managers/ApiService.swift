//
//  ApiService.swift
//  courier
//
//  Created by Владимир Свиридов on 14.02.2022.
//

import Foundation

// функции типа toLogin
// url зашиты здесь
// базовый метод http://courier.emenu.softlab.kz/v1/ + константа
// цель отдть данные

private let baseURL = "http://courier.emenu.softlab.kz/v1/"
private let smsURL = baseURL + "auth/auth"
private let loginByCodeURL = baseURL + "auth/login-by-code"
private let orderListURL = baseURL + "courier/order"


let networkManager = NetworkManager()

class ApiService {
    
    func sendSMS(){
        networkManager.request(url: smsURL, method: .post, body: ["phone": UserDefaults.standard.string(forKey: UserDefaultsKeys.phoneNumber)!]) { response in
            print(response.data ?? "Нет данных")
        } ifError: { error in
            // Передаю в презентер MVCController-а
            print("Имя: \(error.name)")
            print("Сообщение: \(error.message)")
            print("Код: \(error.code)")
            print("Статус: \(error.status)")
        }
    }
    
    func getAuthKey(completion: @escaping (String)->()){
        networkManager.request(url: loginByCodeURL, method: .post, body: ["phone": UserDefaults.standard.string(forKey: UserDefaultsKeys.phoneNumber)!, "code": UserDefaults.standard.string(forKey: UserDefaultsKeys.smsCode) ?? ""], model: UserResponse.self) { posts, post  in
            
            print("Ключ: ", post?.authKey ?? "Нет данных")
            completion(post?.authKey ?? "")
            
        } ifError: { error in
            print("Имя: \(error.name)")
            print("Сообщение: \(error.message)")
            print("Код: \(error.code)")
            print("Статус: \(error.status)")
            
        }
    }
    
    func getOrders(completion: @escaping ([CourierOrderResponseElement]) -> ()){
        
        networkManager.request(url: orderListURL, method: .get, headers: [.authorization(bearerToken: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer)!)], model: CourierOrderResponseElement.self) { posts, _  in
            completion(posts)
            
        } ifError: { error in
            print("Имя: \(error.name)")
            print("Сообщение: \(error.message)")
            print("Код: \(error.code)")
            print("Статус: \(error.status)")
        }
    }
}
