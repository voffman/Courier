//
//  URLs.swift
//  courier
//
//  Created by Владимир Свиридов on 09.02.2022.
//

import Foundation


struct URLs{
    struct Auth{
        static let getSMS = "http://courier.emenu.softlab.kz/v1/auth/auth"
        static let loginByCode = "http://courier.emenu.softlab.kz/v1/auth/login-by-code"
    }
    
    struct CourierOrders{
        static let order = "http://courier.emenu.softlab.kz/v1/courier/order"
    }
}

