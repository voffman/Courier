//
//  Properties.swift
//  courier
//
//  Created by Владимир Свиридов on 10.02.2022.
//

import Foundation

/* struct Properties{ // в userdefaults
    static var phoneNumber: String = ""
    static var smsCode: String? = "" // Передать значение из поля для ввода пользователем. Опционально при вводе 4 символов сменить стиль кнопки
    static var bearer: String? = ""

}
*/

struct UserDefaultsKeys{
    static let phoneNumber: String = "phoneNumber"
    static let smsCode: String = "smsCode"
    static let bearer: String = "bearer"
    static let courierActivity: String = "courierActivity"
}
