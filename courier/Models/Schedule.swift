//
//  Schedule.swift
//  courier
//
//  Created by Владимир Свиридов on 24.02.2022.
//

import Foundation

// Response Body
struct ScheduleElement: Codable {
    let id: Int
    let dateStart, dateEnd: String
    let isConfirmed: Bool
}

typealias Schedule = [ScheduleElement]

