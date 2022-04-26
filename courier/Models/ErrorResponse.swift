//
//  ErrorResponse.swift
//  courier
//
//  Created by Владимир Свиридов on 14.02.2022.
//

import Foundation

struct ErrorResponse: Codable {
    let name, message: String?
    let code, status: Int?
    let type: String?
}
