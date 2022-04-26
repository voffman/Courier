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
    let companyId: Int?
    let inventory: String?
    let courierTypeId: Int?
}
