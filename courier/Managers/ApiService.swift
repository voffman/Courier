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

// Auth
private let smsURL = baseURL + "auth/auth"
private let loginByCodeURL = baseURL + "auth/login-by-code"

// Order
private let orderListURL = baseURL + "courier/order"
private let orderArchiveURL = baseURL + "courier/order/archive-today"

// History
private let historyURLPart1 = baseURL + "courier/order/archive?dateStart="
private let historyURLPart2 = baseURL + "&dateFinish="

// Schedule
private let scheduleListURL = baseURL + "courier/schedule?page="
private let scheduleByIdURL = baseURL + "courier/schedule/"
private let scheduleApplyIdURL = baseURL + "courier/schedule/apply/"

// Slot
private let courierSlotURL = baseURL + "courier/slot"
private let courierSlotStartURL = baseURL + "courier/slot/start"
private let courierSlotStopURL = baseURL + "courier/slot/stop"

let networkManager = NetworkManager()

class ApiService {
    
    // MARK: Auth
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
    
    // MARK: Order
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
    
    func getArchiveOrders(token: String, completion: @escaping ([CourierOrderResponseElement]) -> (), errorResponse: @escaping (ErrorResponse)->()){
        
        networkManager.request(url: orderArchiveURL, method: .get, headers: [.authorization(bearerToken: token)], model: CourierOrderResponseElement.self) { posts, _  in
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
    // MARK: History
    
    func getCourierHistory(token: String, dateStart: String, dateFinish: String, completion: @escaping ([HistoryElement]) -> (), errorResponse: @escaping (ErrorResponse)->()){
        
        networkManager.request(url: historyURLPart1 + dateStart + historyURLPart2 + dateFinish, method: .get, headers: [.authorization(bearerToken: token)], body: ["dateStart": dateStart, "dateFinish": dateFinish], model: HistoryElement.self) { posts, _  in
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
    
   
    // MARK: Schedule
    func getCourierSchedule(token: String, page: String, completion: @escaping ([ScheduleElement]) -> (), errorResponse: @escaping (ErrorResponse)->()){
       
        networkManager.request(url: scheduleListURL + page, method: .get, headers: [.authorization(bearerToken: token)], model: ScheduleElement.self) { posts, _  in
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
        networkManager.request(url: scheduleByIdURL + id, method: .get, headers: [.authorization(bearerToken: token)], model: ScheduleByIDElement.self) { posts, _ in

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
        networkManager.request(url: scheduleApplyIdURL + id, method: .get, headers: [.authorization(bearerToken: token)]) { response in
            print(response.data ?? "Нет данных")
        } ifError: { error in
            errorResponse(error)
        }
    }
    
    // MARK: Courier Slot
    
    func courierSlotActivity(token: String, completion: @escaping ([CourierSlotResponse]) -> (), errorResponse: @escaping (ErrorResponse)->()){
       
        networkManager.request(url: courierSlotURL, method: .get, headers: [.authorization(bearerToken: token)], model: CourierSlotResponse.self) { posts, _  in
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
    
    func courierSlotActivityStart(token: String, completion: @escaping ([CourierSlotResponse]) -> (), errorResponse: @escaping (ErrorResponse)->()){
       
        networkManager.request(url: courierSlotStartURL, method: .get, headers: [.authorization(bearerToken: token)], model: CourierSlotResponse.self) { posts, _  in
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
    
    func courierSlotActivityStop(token: String, completion: @escaping ([CourierSlotResponse]) -> (), errorResponse: @escaping (ErrorResponse)->()){
       
        networkManager.request(url: courierSlotURL, method: .get, headers: [.authorization(bearerToken: token)], model: CourierSlotResponse.self) { posts, _  in
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
}
