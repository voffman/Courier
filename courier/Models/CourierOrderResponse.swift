//
//  CourierOrderResponse.swift
//  courier
//
//  Created by Владимир Свиридов on 10.02.2022.
//

import Foundation

// MARK: - CourierOrderResponseElement
struct CourierOrderResponseElement: Codable {
    let id, companyID: Int
    let companyName, phone, customerName: String
    let status: Int
    let statusName, statusAction: String
    let point: Point
    let createdAt, updatedAt, setCourierDateTime: String
    let orderItems: [OrderItem]
    let sumItems, deliveryPrice: Int
    let dateTimeFinish, dateTimeStatusFinish: String
    let correctionalPrice, sumTotal, paymentTypeID: Int
    let addressFrom: AddressFrom
    let addressTo: AddressTo
    let transitions: Transitions
    let redistributed: Bool
    let comments, deliveryTime, customerAmount: String?

    enum CodingKeys: String, CodingKey {
        case id
        case companyID = "companyId"
        case companyName, phone, customerName, status, statusName, statusAction, point, createdAt, updatedAt, setCourierDateTime, orderItems, sumItems, deliveryPrice, dateTimeFinish, dateTimeStatusFinish, correctionalPrice, sumTotal
        case paymentTypeID = "paymentTypeId"
        case addressFrom, addressTo, transitions, redistributed, comments, deliveryTime, customerAmount
    }
}

// MARK: - AddressFrom
struct AddressFrom: Codable {
    let address, lat, long, phone: String
}

// MARK: - AddressTo
struct AddressTo: Codable {
    let street, house: String
    let flat, addressMore: String?
    let lat, long: String
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
