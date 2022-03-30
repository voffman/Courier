//
//  OrderStatusResponse.swift
//  courier
//
//  Created by Владимир Свиридов on 28.03.2022.
//

import Foundation

// MARK: - OrderStatusResponse
struct OrderStatusResponse: Codable {
    let id, companyID: Int
    let companyName, phone, customerName: String
    let status: Int
    let statusName, statusAction, createdAt, updatedAt: String
    let setCourierDateTime: String
    let orderItems: [OrderItem1]
    let sumItems, deliveryPrice: Int
    let dateTimeFinish, dateTimeStatusFinish: String
    let correctionalPrice, sumTotal, paymentTypeID: Int
    let addressFrom: AddressFrom1
    let addressTo: AddressTo1
    let transitions: Transitions1
    let redistributed: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case companyID = "companyId"
        case companyName, phone, customerName, status, statusName, statusAction, createdAt, updatedAt, setCourierDateTime, orderItems, sumItems, deliveryPrice, dateTimeFinish, dateTimeStatusFinish, correctionalPrice, sumTotal
        case paymentTypeID = "paymentTypeId"
        case addressFrom, addressTo, transitions, redistributed
    }
}

// MARK: - AddressFrom
struct AddressFrom1: Codable {
    let address, lat, long, phone: String
}

// MARK: - AddressTo
struct AddressTo1: Codable {
    let street, house, flat, addressMore: String
    let lat, long: String
}

// MARK: - OrderItem
struct OrderItem1: Codable {
    let name, orderItemDescription: String
    let quantity, price: Int

    enum CodingKeys: String, CodingKey {
        case name
        case orderItemDescription = "description"
        case quantity, price
    }
}

// MARK: - Transitions
struct Transitions1: Codable {
    let status: Int
    let title, alertTitle, alertDescription, alertPositive: String
    let alertNegative: String
}
