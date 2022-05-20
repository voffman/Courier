//
//  ScheduleById.swift
//  courier
//
//  Created by Владимир Свиридов on 24.02.2022.
//

import Foundation

// MARK: - ScheduleByIDElement
struct ScheduleByIDElement: Codable {
    let dateItem: String?
    let timeStart, timeEnd: String?
    let point: PointSchedule?
}

// MARK: - Point
struct PointSchedule: Codable {
    let id: Int?
    let name, description, lat, long: String?
}

typealias ScheduleByID = [ScheduleByIDElement]

