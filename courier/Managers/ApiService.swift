//
//  ApiService.swift
//  courier
//
//  Created by Владимир Свиридов on 14.02.2022.
//

import Foundation
import Alamofire



private let baseURL = "Базовый URL"

// Auth
private let smsURL = baseURL + "auth/auth"
private let loginByCodeURL = baseURL + "auth/login-by-code"

// Order
private let orderListURL = baseURL + "courier/order"
private let orderArchiveURL = baseURL + "courier/order/archive-today"
private let orderListStatusURLPart1 = baseURL + "courier/order/"
private let orderListStatusURLPart2 = "/change-status/"
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

// Profile
private let employeeURL = baseURL + "user"

//courier location
private let locationURL = baseURL + "courier/location"

// Salary
private let salaryURL = baseURL + "courier/salary/period"


let networkManager = NetworkManager()

class ApiService {
    
    // MARK: Auth
    func sendSMS(phoneNumber: String, completion: @escaping (AFDataResponse<Data?>)->(), errorResponse: @escaping (ErrorResponse)->()){
        networkManager.request(url: smsURL, method: .post, body: ["phone": phoneNumber]) { response in
            print(response.data ?? "Нет данных")
            completion(response)
            
        } ifError: { error in
            errorResponse(error)
        }
    }
    
    func getAuthKey(phoneNumber: String, smsCode: String, completion: @escaping ([UserResponse])->(), errorResponse: @escaping (ErrorResponse)->()){
        networkManager.request(url: loginByCodeURL, method: .post, validateRange: 200...401, body: ["phone": phoneNumber, "code": smsCode], model: UserResponse.self, isSingleInstance: true) { posts, post  in
            
            print("Ключ: ", post?.authKey ?? "Нет данных")
            completion(posts)
            
        } ifError: { error in
            errorResponse(error)
        }
    }
    
    // MARK: Order
    func getOrders(completion: @escaping ([CourierOrderResponseElement]) -> (), errorResponse: @escaping (ErrorResponse)->()){
        
        networkManager.request(url: orderListURL, method: .get, model: CourierOrderResponseElement.self) { posts, _  in
            completion(posts)
            
        } ifError: { error in
            errorResponse(error)
        }
    }
    
    func getArchiveOrders(completion: @escaping ([CourierOrderResponseElement]) -> (), errorResponse: @escaping (ErrorResponse)->()){
        
        networkManager.request(url: orderArchiveURL, method: .get, model: CourierOrderResponseElement.self) { posts, _  in
            completion(posts)
            
        } ifError: { error in
            errorResponse(error)
        }
    }
    
    func changeOrderStatus(orderId: String, status: String,  completion: @escaping (OrderStatusResponse)->(), errorResponse: @escaping (ErrorResponse)->()){
        networkManager.request(url: orderListStatusURLPart1 + orderId + orderListStatusURLPart2 + status, method: .get, model: OrderStatusResponse.self, isSingleInstance: true) { posts, post  in
            completion(post ?? OrderStatusResponse(id: nil, companyId: nil, companyName: nil, phone: nil, customerName: nil, status: nil, statusName: nil, createdAt: nil, updatedAt: nil, setCourierDateTime: nil, orderItems: nil, sumItems: nil, deliveryPrice: nil, dateTimeFinish: nil, correctionalPrice: nil, sumTotal: nil, paymentTypeId: nil, addressFrom: nil, addressTo: nil, redistributed: nil))
            
        } ifError: { error in
            errorResponse(error)
        }
    }
    
    
    // MARK: History
    
    func getCourierHistory(dateStart: String, dateFinish: String, completion: @escaping ([HistoryElement]) -> (), errorResponse: @escaping (ErrorResponse)->()){
        
        networkManager.request(url: historyURLPart1 + dateStart + historyURLPart2 + dateFinish, method: .get, body: ["dateStart": dateStart, "dateFinish": dateFinish], model: HistoryElement.self) { posts, _  in
            completion(posts)
            
        } ifError: { error in
            errorResponse(error)
        }
    }
    
   
    // MARK: Schedule
    func getCourierSchedule(page: String, completion: @escaping ([ScheduleElement]) -> (), errorResponse: @escaping (ErrorResponse)->()){
       
        networkManager.request(url: scheduleListURL + page, method: .get, model: ScheduleElement.self) { posts, _  in
            completion(posts)

        } ifError: { error in
            errorResponse(error)
        }
    }
    
    func getCourierScheduleById(id: String, completion: @escaping ([ScheduleByIDElement]) -> (), errorResponse: @escaping (ErrorResponse)->()){
        networkManager.request(url: scheduleByIdURL + id, method: .get, model: ScheduleByIDElement.self) { posts, _ in

            completion(posts)
        } ifError: { error in
            errorResponse(error)
        }

    }

    func scheduleApplyStatus(id: String, errorResponse: @escaping (ErrorResponse)->()){
        networkManager.request(url: scheduleApplyIdURL + id, method: .get) { response in
            print(response.data ?? "Нет данных")
        } ifError: { error in
            errorResponse(error)
        }
    }
    
    // MARK: Courier Slot
    
    func courierSlotActivity(completion: @escaping (CourierSlotResponse) -> (), errorResponse: @escaping (ErrorResponse)->()){
       
        networkManager.request(url: courierSlotURL, method: .get, model: CourierSlotResponse.self, isSingleInstance: true) { _, post  in
            completion(post ?? CourierSlotResponse(sessionStart: nil, sessionEnd: nil, status: nil, point: nil))

        } ifError: { error in
            errorResponse(error)
        }
    }
    
    func courierSlotActivityStart(completion: @escaping (AFDataResponse<Data?>)->(), errorResponse: @escaping (ErrorResponse)->()){
       
        networkManager.request(url: courierSlotStartURL, method: .get) { response in
            completion(response)
            
        } ifError: { error in
            errorResponse(error)
        }
    }
    
    func courierSlotActivityStop(completion: @escaping (AFDataResponse<Data?>)->(), errorResponse: @escaping (ErrorResponse)->()){
       
        networkManager.request(url: courierSlotStopURL, method: .get) { response in
            completion(response)
            
        } ifError: { error in
            errorResponse(error)
        }
    }
    
    // MARK: Profile
    func getEmployeeData(completion: @escaping (EmployeeResponse)->(), errorResponse: @escaping (ErrorResponse)->()){
        networkManager.request(url: employeeURL, method: .get, model: EmployeeResponse.self, isSingleInstance: true) { posts, post  in
            completion(post ?? EmployeeResponse(id: nil, fio: nil, phone: nil, lastLogin: nil, authKey: nil, role: nil, accesses: nil, allowedCities: nil, inventory: nil, courierTypeID: nil))
            
        } ifError: { error in
            errorResponse(error)
        }
    }
    
    // MARK: courier location
    func saveCourierLocation(latitude: String, longitude: String, completion: @escaping (ErrorResponse)->()){
        networkManager.request(url: locationURL, method: .post, body: ["lat": latitude, "long": longitude]) { response in
            print(response.data ?? "Нет данных")

        } ifError: { error in
            completion(error)
        }
    }
    
    // MARK: Salary
    func getSalary(dateStart: String, dateEnd: String, completion: @escaping (Salary)->(), errorResponse: @escaping (ErrorResponse)->()) {
        networkManager.request(url: salaryURL, method: .post, body: ["dateStart": dateStart,"dateEnd": dateEnd], model: Salary.self, isSingleInstance: true) { _, post in
            completion(post ?? Salary(countSuccessOrders: nil, workHours: nil, hoursAmount: nil, orderAmount: nil, penaltyAmount: nil, totalAmount: nil, bonusAmount: nil, balance: nil, cashDeliveryAmount: nil, holdingAmount: nil, distance: nil))
        } ifError: { error in
            errorResponse(error)
        }
    }
}
