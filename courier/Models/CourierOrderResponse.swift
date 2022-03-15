//
//  CourierOrderResponse.swift
//  courier
//
//  Created by Владимир Свиридов on 10.02.2022.
//

import Foundation

// MARK: - Получение списка активных заказов курьера

struct CourierOrderResponseElement: Codable {
    let id: Int
    let externalID: String
    let companyID: Int
    let companyName, phone, customerName: String
    let status: Int
    let statusName, statusAction: String
    let point: Point
    let createdAt, updatedAt, setCourierDateTime: String
    var orderItems: [OrderItem]
    let sumItems, deliveryPrice: Int
    let deliveryTime: String?
    let dateTimeFinish, dateTimeStatusFinish: String
    let correctionalPrice, sumTotal, paymentTypeID: Int
    let addressFrom: AddressFrom
    let addressTo: AddressTo
    let comments: String?
    let transitions: Transitions
    let redistributed: Bool
    let customerAmount: String?

    enum CodingKeys: String, CodingKey {
        case id
        case externalID = "externalId"
        case companyID = "companyId"
        case companyName, phone, customerName, status, statusName, statusAction, point, createdAt, updatedAt, setCourierDateTime, orderItems, sumItems, deliveryPrice, deliveryTime, dateTimeFinish, dateTimeStatusFinish, correctionalPrice, sumTotal
        case paymentTypeID = "paymentTypeId"
        case addressFrom, addressTo, comments, transitions, redistributed, customerAmount
    }
}

// MARK: - AddressFrom
struct AddressFrom: Codable {
    let address, lat, long, phone: String
}

// MARK: - AddressTo
struct AddressTo: Codable {
    let street, house, lat, long: String
    let flat, addressMore: String?
}

// MARK: - OrderItem
struct OrderItem: Codable {
    let name: String
    let orderItemDescription: String?
    let quantity, price: Int

    enum CodingKeys: String, CodingKey {
        case name
        case orderItemDescription = "description"
        case quantity, price
    }
}

// MARK: - Point
struct Point: Codable {
    let id: Int
    let name, pointDescription, lat, long: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case pointDescription = "description"
        case lat, long
    }
}

// MARK: - Transitions
struct Transitions: Codable {
    let status: Int
    let title, alertTitle, alertDescription, alertPositive: String
    let alertNegative: String
}

typealias CourierOrderResponse = [CourierOrderResponseElement]
