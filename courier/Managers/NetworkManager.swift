//
//  NetworkManager.swift
//  courier
//
//  Created by Владимир Свиридов on 09.02.2022.
//

import Foundation
import Alamofire

final class NetworkManager {
    
   private func printError(error: ErrorResponse){
        print("Имя: \(error.name ?? "Нет данных")")
        print("Сообщение: \(error.message ?? "Нет данных")")
        print("Код: \(error.code ?? 0) ")
        print("Статус: \(error.status ?? 0)")
        print("Тип ошибки: \(error.type ?? "Нет данных")")
    }
    
  private func printResponseError(response: DataResponse<ErrorResponse, AFError>){
        print("response.result \(response.result)")
        print("response.data \(String(describing: response.data))")
        print("response.request \(String(describing: response.request))")
        print("response.error \(String(describing: response.error))")
    }
    
    var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    func request<T: Decodable>(url: URLConvertible, method: HTTPMethod, validateRange: ClosedRange<Int> = 200...299, headers: HTTPHeaders? = [.authorization(bearerToken: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "")], body: [String: Any]? = [:], model: T.Type, isSingleInstance: Bool? = false, ifSuccess: @escaping ([T], T?)->(), ifError: @escaping (ErrorResponse)->()) {
        if isConnectedToInternet {
            switch isSingleInstance {
                
            case true:
                AF.request(url, method: method, parameters: body, headers: headers).validate(statusCode: validateRange).responseDecodable(of: T.self) { response in
                    
                    switch response.result {
                    case .success(let posts):
                        ifSuccess([posts], posts)
                        
                    case .failure(let error):
                        print(String(describing: error))
                        AF.request(url, headers: headers).validate().responseDecodable(of: ErrorResponse.self) { response in
                            
                            switch response.result {
                            case .success(let errorValue):
                                self.printError(error: errorValue)
                                ifError(errorValue)
                                
                            case .failure(let error):
                                print(error.localizedDescription)
                                
                                AF.request(url, headers: headers).validate().responseDecodable(of: ErrorResponse.self) { response in
                                    
                                    switch response.result {
                                    case .success(let errorValue):
                                        ifError(errorValue)
                                        
                                    case .failure(let error):
                                        print(String(describing: error))
                                    }
                                }
                            }
                        }
                    }
                }
                
            case false:
                AF.request(url, method: .get, parameters: body, headers: headers).validate(statusCode: validateRange).responseDecodable(of: [T].self) { response in
                    
                    switch response.result {
                    case .success(let posts):
                        ifSuccess(posts, posts as? T)
                        
                    case .failure(let error):
                        print(String(describing: error))
                        AF.request(url, headers: headers).validate().responseDecodable(of: ErrorResponse.self) { response in
                            
                            switch response.result {
                            case .success(let errorValue):
                                ifError(errorValue)
                                
                            case .failure(let error):
                                print(String(describing: error))
                                self.printResponseError(response: response)
                                
                                AF.request(url, headers: headers).validate().responseDecodable(of: ErrorResponse.self) { response in
                                    switch response.result {
                                    case .success(let errorValue):
                                        ifError(errorValue)
                                        
                                    case .failure(let error):
                                        print(String(describing: error))
                                    }
                                }
                            }
                        }
                    }
                }
                
            default:
                break
            }
        } else {
            ifError(ErrorResponse(name: "Нет соеденения с интернетом",
                                  message: "Проверьте интернет-соединение",
                                  code: 0,
                                  status: 0,
                                  type: "No Internet"))
        }
    }
    
    
    func request(url: URLConvertible, method: HTTPMethod, validateRange: ClosedRange<Int> = 200...299, headers: HTTPHeaders? = [.authorization(bearerToken: UserDefaults.standard.string(forKey: UserDefaultsKeys.bearer) ?? "")], body: [String: Any]? = [:], ifSuccess: @escaping (AFDataResponse<Data?>)->(), ifError: @escaping (ErrorResponse)->()){
        if isConnectedToInternet {
            AF.request(url, method: method, parameters: body, headers: headers).validate(statusCode: validateRange).response { response in
                switch response.result {
                case .success:
                    ifSuccess(response)
                    
                case .failure(let error):
                    print(error)
                    
                    AF.request(url, headers: headers).responseDecodable(of: ErrorResponse.self) { response in
                        switch response.result {
                        case .success(let errorValue):
                            self.printError(error: errorValue)
                            ifError(errorValue)
                            
                        case .failure(let error):
                            print(String(describing: error))
                        }
                    }
                }
            }
        } else {
            print("Нет соеденения с интернетом")
            ifError(ErrorResponse(name: "Нет соеденения с интернетом",
                                  message: "Проверьте интернет-соединение",
                                  code: 0,
                                  status: 0,
                                  type: "No Internet"))
        }
    }
}

