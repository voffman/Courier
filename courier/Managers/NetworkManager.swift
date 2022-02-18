//
//  NetworkManager.swift
//  courier
//
//  Created by Владимир Свиридов on 09.02.2022.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    func request<T: Decodable>(url: URLConvertible, method: HTTPMethod, headers: HTTPHeaders? = [], body: [String: Any]? = [:], model: T.Type, ifSuccess: @escaping ([T], T?)->(), ifError: @escaping (ErrorResponse)->()) {
        
        switch method{
            
        case .get:
            AF.request(url, headers: headers).validate(statusCode: 200..<300).responseDecodable(of: [T].self) { response in
                
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
            
            
        case .post:
            
            AF.request(url, method: .post, parameters: body, headers: headers).validate(statusCode: 200..<300).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let result):
                    ifSuccess([result], result)
                    
                case .failure(let error):
                    print("Error description is: \(String(describing: error))")
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
        default:
            return
        }
    }
    
    
    func request(url: URLConvertible, method: HTTPMethod, headers: HTTPHeaders? = [], body: [String: Any]? = [:], ifSuccess: @escaping (AFDataResponse<Any>)->(), ifError: @escaping (ErrorResponse)->()){
        switch method {
            
        case .get:
            AF.request(url, headers: headers).responseJSON { response in
                print(response)
                ifSuccess(response)
            }
            
        case .post:
            AF.request(url, method: .post, parameters: body, encoding:  URLEncoding.queryString, headers: headers).validate(statusCode: 200..<300).response { response in
                switch response.result {
                case .success:
                    print("response.result \(response.result)")
                    print("response.data \(String(describing: response.data))")
                    print("response.request \(String(describing: response.request))")
                    print("response.error \(String(describing: response.error))")
                    
                case .failure(let error):
                    print(error)
                    AF.request(url, headers: headers).responseDecodable(of: ErrorResponse.self) { response in
                        
                        switch response.result {
                        case .success(let errorValue):
                            ifError(errorValue)
                            
                        case .failure(let error):
                            print(String(describing: error))
                        }
                    }
                }
            }
            
        default:
            return
        }
    }
}


// MARK: методы
/*
 func getRequest<T: Decodable>(url: URLConvertible, headers: HTTPHeaders, model: T.Type ,completion:  @escaping ([T])->()){
 AF.request(url, headers: headers).validate().responseDecodable(of: [T].self) { response in
 switch response.result {
 case .success(let posts):
 
 completion(posts)
 print("status \(response.response!.statusCode)" )
 case .failure(let error):
 print(String(describing: error))
 
 }
 }
 }
 
 
 func getRequest(url: URLConvertible, headers: HTTPHeaders){
 AF.request(url, headers: headers).responseJSON { response in
 print(response)
 }
 }
 
 
 func postRequest<T: Decodable>(url: URLConvertible, headers: HTTPHeaders, body: [String: Any], model: T.Type ,completion: @escaping (T)->()) {
 AF.request(url, method: .post, parameters: body, headers: headers).responseDecodable(of: T.self) { response in
 switch response.result {
 case let .success(result):
 completion(result)
 print("status \(response.response!.statusCode)" )
 case let .failure(error):
 print("Error description is: \(String(describing: error))")
 
 }
 }
 }
 
 func postRequest(url: URLConvertible, headers: HTTPHeaders, body: [String: Any]){
 AF.request(url, method: .post, parameters: body, encoding:  URLEncoding.queryString, headers: headers).response { response in
 switch response.result {
 case .success:
 print(response.result)
 print("status \(response.response!.statusCode)" )
 //   print("status 2 - \(response)" )
 case let .failure(error):
 print(error)
 }
 }
 }
 }
 */
