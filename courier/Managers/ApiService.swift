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

// Schedule
private let scheduleList = baseURL + "courier/schedule?page="
private let scheduleById = baseURL + "courier/schedule/"
private let scheduleApplyId = baseURL + "courier/schedule/apply/"



let networkManager = NetworkManager()

class ApiService {
    
    func sendSMS(phoneNumber: String, completion: @escaping (ErrorResponse)->()){
        networkManager.request(url: smsURL, method: .post, body: ["phone": phoneNumber]) { response in
            print(response.data ?? "Нет данных")

        } ifError: { error in
            completion(error)
        }
    }
    
    func getAuthKey(phoneNumber: String, smsCode: String, completion: @escaping (String)->(), errorResponse: @escaping (ErrorResponse)->()){
        networkManager.request(url: loginByCodeURL, method: .post, body: ["phone": phoneNumber, "code": smsCode], model: UserResponse.self) { posts, post  in
            
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
    
    func getOrders(token: String, completion: @escaping ([CourierOrderResponseElement]) -> (), errorResponse: @escaping (ErrorResponse)->()){
        
        networkManager.request(url: orderListURL, method: .get, headers: [.authorization(bearerToken: token)], model: CourierOrderResponseElement.self) { posts, _  in
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
    
    
    
    // Schedule
    func getCourierSchedule(token: String, page: String, completion: @escaping ([ScheduleElement]) -> (), errorResponse: @escaping (ErrorResponse)->()){
       
        networkManager.request(url: scheduleList + page, method: .get, headers: [.authorization(bearerToken: token)], model: ScheduleElement.self) { posts, _  in
            completion(posts)

        } ifError: { error in
            errorResponse(error)
            
            print("Имя: \(error.name)")
            print("Сообщение: \(error.message)")
            print("Код: \(error.code)")
            print("Статус: \(error.status)")
            print("Тип ошибки: \(error.type)")
        }
    }
    
    func getCourierScheduleById(token: String, id: String, completion: @escaping ([ScheduleByIDElement]) -> (), errorResponse: @escaping (ErrorResponse)->()){
        networkManager.request(url: scheduleById + id, method: .get, headers: [.authorization(bearerToken: token)], model: ScheduleByIDElement.self) { posts, _ in

            completion(posts)
        } ifError: { error in
            errorResponse(error)
            
            print("Имя: \(error.name)")
            print("Сообщение: \(error.message)")
            print("Код: \(error.code)")
            print("Статус: \(error.status)")
            print("Тип ошибки: \(error.type)")
        }

    }

    func scheduleApplyStatus(token: String, id: String, errorResponse: @escaping (ErrorResponse)->()){
        networkManager.request(url: scheduleApplyId + id, method: .get, headers: [.authorization(bearerToken: token)]) { response in
            print(response.data ?? "Нет данных")
        } ifError: { error in
            errorResponse(error)
        }
    }
}
