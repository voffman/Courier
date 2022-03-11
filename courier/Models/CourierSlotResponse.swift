//
//  CourierSlotResponse.swift
//  courier
//
//  Created by Владимир Свиридов on 11.03.2022.
//

import Foundation


// MARK: - CourierSlotResponse - ответ
struct CourierSlotResponse: Codable {
    let date, sessionStart, sessionEnd: String
    let status: Bool
    let point: Pointttt
}

// MARK: - Point
struct Pointttt: Codable {
    let id: Int
    let name, pointDescription: String
    let lat, long: Double

    enum CodingKeys: String, CodingKey {
        case id, name
        case pointDescription = "description"
        case lat, long
    }
}

/*
// MARK: - CourierSlotResponse - пример
struct CourierSlotResponse: Codable {
    let  sessionStart, sessionEnd: String
    let status: Bool
    let point: Pointttt
}

// MARK: - Point
struct Pointttt: Codable {
    let id: Int
    let name, pointDescription: String
    let lat, long: Double

    enum CodingKeys: String, CodingKey {
        case id, name
        case pointDescription = "description"
        case lat, long
    }
}
*/
