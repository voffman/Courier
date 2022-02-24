//
//  Schedule.swift
//  courier
//
//  Created by Владимир Свиридов on 24.02.2022.
//

import Foundation
/*
// Example

// MARK: - ScheduleElement
struct ScheduleElement: Codable {
    let id, countCourier, countConfirmCourier: Int
    let confirmCouriers: [ConfirmCourier]
    let cityID: Int
    let dateStart, dateEnd: String
    let isPublished, isModified: Bool

    enum CodingKeys: String, CodingKey {
        case id, countCourier, countConfirmCourier, confirmCouriers
        case cityID = "cityId"
        case dateStart, dateEnd, isPublished, isModified
    }
}

// MARK: - ConfirmCourier
struct ConfirmCourier: Codable {
    let courierID: Int
    let isConfirmed: Bool
    let confirmedAt: String

    enum CodingKeys: String, CodingKey {
        case courierID = "courierId"
        case isConfirmed, confirmedAt
    }
}

typealias Schedule = [ScheduleElement]
*/




// Response Body
struct ScheduleElement: Codable {
    let id: Int
    let dateStart, dateEnd: String
    let isConfirmed: Bool
}

typealias Schedule = [ScheduleElement]

