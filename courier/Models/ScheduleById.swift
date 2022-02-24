//
//  ScheduleById.swift
//  courier
//
//  Created by Владимир Свиридов on 24.02.2022.
//

import Foundation

/*
// Example
// MARK: - ScheduleByID
struct ScheduleByID: Codable {
    let dateItem, timeStart, timeEnd: String
    let point: Pointt
}

// MARK: - Point
struct Pointt: Codable {
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


// Response Body
// MARK: - ScheduleByIDElement
struct ScheduleByIDElement: Codable {
    let dateItem: String
    let timeStart, timeEnd: String?
    let point: Pointt?
}

// MARK: - Point
struct Pointt: Codable {
    let id: Int
    let name, pointDescription, lat, long: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case pointDescription = "description"
        case lat, long
    }
}

typealias ScheduleByID = [ScheduleByIDElement]

