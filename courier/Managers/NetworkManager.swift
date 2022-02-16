//
//  NetworkManager.swift
//  courier
//
//  Created by Владимир Свиридов on 09.02.2022.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    func makeRequest<T: Decodable>(url: URLConvertible, method: HTTPMethod, headers: HTTPHeaders? = [], body: [String: Any]? = [:], model: T.Type? = Decodable.self as? T.Type, ifSuccess: @escaping ([T]?)->(), ifError: @escaping (ErrorResponse)->()) {
        
        switch method{
            
        case .get:
            if model != nil{
                AF.request(url, headers: headers).validate().responseDecodable(of: [T].self) { response in
                    
                    switch response.result {
                    case .success(let posts):
                        ifSuccess(posts)
                        
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
            
            AF.request(url, headers: headers).responseJSON { response in
                switch response.result{
                case .success(let posts):
                    print("Response: \(response) || posts: \(posts) ")
                    ifSuccess(posts as? [T])
                    
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
            
        case .post:
            if let model = model{
                
                AF.request(url, method: .post, parameters: body, headers: headers).responseDecodable(of: T.self) { response in
                    switch response.result {
                    case let .success(result):
                        ifSuccess(result as? [T])
                        
                    case let .failure(error):
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
            }
            
            AF.request(url, method: .post, parameters: body, encoding:  URLEncoding.queryString, headers: headers).response { response in
                switch response.result {
                case .success:
                    print(response.result)
                    
                case let .failure(error):
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
            
            
        default:
            return
        }
    }
    
    
    
    
    // MARK: методы
    
    func getRequest<T: Decodable>(url: URLConvertible, headers: HTTPHeaders, model: T.Type ,completion:  @escaping ([T])->()){
        AF.request(url, headers: headers).validate().responseDecodable(of: [T].self) { response in
            switch response.result {
            case .success(let posts):
                
                completion(posts)
                
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
            case let .failure(error):
                print(error)
            }
        }
    }
}
