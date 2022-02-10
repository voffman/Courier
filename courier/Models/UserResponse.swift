//
//  UserResponse.swift
//  courier
//
//  Created by Владимир Свиридов on 09.02.2022.
//

import Foundation

// MARK: - login-by-code
struct UserResponse: Codable {
    let id: Int?
    let fio, phone, email, lastLogin: String?
    let authKey, role, accesses, allowedCities: String?
    let companyID: Int?
    let inventory: String?
    let courierTypeID: Int?

    enum CodingKeys: String, CodingKey {
        case id, fio, phone, email, lastLogin, authKey, role, accesses, allowedCities
        case companyID = "companyId"
        case inventory
        case courierTypeID = "courierTypeId"
    }
}
