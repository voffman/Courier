//
//  OrderStatusResponse.swift
//  courier
//
//  Created by Владимир Свиридов on 28.03.2022.
//

import Foundation

// MARK: - OrderStatusResponse
struct OrderStatusResponse: Codable {
    let id: Int
    let externalID: String
    let companyID: Int
    let companyName, phone, customerName: String
    let status: Int
    let statusName, statusAction, createdAt, updatedAt: String
    let setCourierDateTime: String
    let orderItems: [OrderItemmm]
    let sumItems, deliveryPrice: Int
    let dateTimeFinish, dateTimeStatusFinish: String
    let correctionalPrice, sumTotal, paymentTypeID: Int
    let addressFrom: AddressFrommm
    let addressTo: AddressTooo
    let transitions: Transitionss
    let redistributed: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case externalID = "externalId"
        case companyID = "companyId"
        case companyName, phone, customerName, status, statusName, statusAction, createdAt, updatedAt, setCourierDateTime, orderItems, sumItems, deliveryPrice, dateTimeFinish, dateTimeStatusFinish, correctionalPrice, sumTotal
        case paymentTypeID = "paymentTypeId"
        case addressFrom, addressTo, transitions, redistributed
    }
}

// MARK: - AddressFrom
struct AddressFrommm: Codable {
    let address, lat, long, phone: String
}

// MARK: - AddressTo
struct AddressTooo: Codable {
    let street, house, flat, addressMore: String
    let lat, long: String
}

// MARK: - OrderItem
struct OrderItemmm: Codable {
    let name: String
    let orderItemDescription: String?
    let quantity, price: Int

    enum CodingKeys: String, CodingKey {
        case name
        case orderItemDescription = "description"
        case quantity, price
    }
}

// MARK: - Transitions
struct Transitionss: Codable {
    let status: Int
    let title, alertTitle, alertDescription, alertPositive: String
    let alertNegative: String
}
