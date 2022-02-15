//
//  ErrorResponse.swift
//  courier
//
//  Created by Владимир Свиридов on 14.02.2022.
//

import Foundation

struct ErrorResponse: Codable {
    let name, message: String
    let code, status: Int
    let type: String
}

// выводить коды ошибки JSON-а как в сваггере   "message": "Пользователя не существует", "code": 0, "status": 404,
// и передавать в MVP контроллер
