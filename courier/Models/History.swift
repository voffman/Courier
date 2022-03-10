//
//  History.swift
//  courier
//
//  Created by Владимир Свиридов on 10.03.2022.
//

import Foundation

// MARK: - HistoryElement
struct HistoryElement: Codable {
    let id: Int
    let externalID: String
    let companyID: Int
    let companyName, phone, customerName: String
    let status: Int
    let statusName: String
    let point: Point
    let createdAt, updatedAt, setCourierDateTime: String
    let orderItems: [OrderItem]
    let sumItems: Int?
    let deliveryPrice: Int
    let deliveryTime: String?
    let dateTimeFinish: String
    let correctionalPrice, sumTotal, paymentTypeID: Int
    let addressFrom: AddressFrom
    let addressTo: AddressTo
    let comments, customerAmount: String?
    let redistributed: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case externalID = "externalId"
        case companyID = "companyId"
        case companyName, phone, customerName, status, statusName, point, createdAt, updatedAt, setCourierDateTime, orderItems, sumItems, deliveryPrice, deliveryTime, dateTimeFinish, correctionalPrice, sumTotal
        case paymentTypeID = "paymentTypeId"
        case addressFrom, addressTo, comments, customerAmount, redistributed
    }
}

// MARK: - AddressFrom
struct AddressFromm: Codable {
    let address, lat, long, phone: String
}

// MARK: - AddressTo
struct AddressToo: Codable {
    let street, house, lat, long: String
    let flat: String?
}

// MARK: - OrderItem
struct OrderItemm: Codable {
    let name: String
    let quantity, price: Int
}

// MARK: - Point
struct Pointtt: Codable {
    let id: Int
    let name, pointDescription, lat, long: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case pointDescription = "description"
        case lat, long
    }
}

typealias History = [HistoryElement]
