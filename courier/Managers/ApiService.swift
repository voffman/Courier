//
//  ApiService.swift
//  courier
//
//  Created by Владимир Свиридов on 14.02.2022.
//

import Foundation
import UIKit

// функции типа toLogin
// url зашиты здесь
// базовый метод http://courier.emenu.softlab.kz/v1/ + константа
// цель отдть данные

private let baseURL = "http://courier.emenu.softlab.kz/v1/"
private let smsURL = baseURL + "auth/auth"
private let loginByCodeURL = baseURL + "auth/login-by-code"
private let orderListURL = baseURL + "courier/order"


let networkManager = NetworkManager()
let mvpController = MVPController()


class ApiService: UIViewController {
    
    func sendSMS(completion: @escaping (ErrorResponse)->()){
        
        networkManager.request(url: smsURL, method: .post, body: ["phone": UserDefaults.standard.string(forKey: UserDefaultsKeys.phoneNumber)!]) { response in
            print(response.data ?? "Нет данных")
        } ifError: { error in
            completion(error)
        }
    }
    
    func getAuthKey(completion: @escaping (String)->(), errorResponse: @escaping (ErrorResponse)->()){
        networkManager.request(url: loginByCodeURL, method: .post, body: ["phone": UserDefaults.standard.string(forKey: UserDefaultsKeys.phoneNumber)!, "code": UserDefaults.standard.string(forKey: UserDefaultsKeys.smsCode) ?? ""], model: UserResponse.self) { posts, post  in
            
            print("Ключ: ", post?.authKey ?? "Нет данных")
            completion(post?.authKey ?? "")
            
        } ifError: { error in

            errorResponse(error)
            /*
            print("Имя: \(error.name)")
            print("Сообщение: \(error.message)")
            print("Код: \(error.code)")
            print("Статус: \(error.status)")
            print("Тип ошибки: \(error.type)")
             */
        }
    }
    
    func getOrders(completion: @escaping ([CourierOrderResponseElement]) -> (), errorResponse: @escaping (ErrorResponse)->()){
        
        networkManager.request(url: orderListURL, method: .get, headers: [.authorization(bearerToken: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer)!)], model: CourierOrderResponseElement.self) { posts, _  in
            completion(posts)
            
        } ifError: { error in
            errorResponse(error)
            /*
            print("Имя: \(error.name)")
            print("Сообщение: \(error.message)")
            print("Код: \(error.code)")
            print("Статус: \(error.status)")
            print("Тип ошибки: \(error.type)")
             */
        }
    }
}
