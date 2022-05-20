//
//  CourierSlotResponse.swift
//  courier
//
//  Created by Владимир Свиридов on 11.03.2022.
//

import Foundation


// MARK: - CourierSlotResponse - ответ
struct CourierSlotResponse: Codable {
    let sessionStart, sessionEnd: String?
    let status: Bool?
    let point: PointSlot?
}

// MARK: - Point
struct PointSlot: Codable {
    let id: Int?
    let name, description, lat, long: String?
}
