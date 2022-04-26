//
//  CourierOrderResponse.swift
//  courier
//
//  Created by Владимир Свиридов on 10.02.2022.
//

import Foundation

// MARK: - CourierOrderResponseElement
struct CourierOrderResponseElement: Codable {
    let id, companyId: Int
    let companyName, phone, customerName: String
    let status: Int
    let statusName, statusAction: String
    let point: PointCourierOrderResponse
    let createdAt, updatedAt, setCourierDateTime: String
    let orderItems: [OrderItemCourierOrderResponse]
    let sumItems, deliveryPrice: Int
    let dateTimeFinish, dateTimeStatusFinish: String
    let correctionalPrice, sumTotal, paymentTypeId: Int
    let addressFrom: AddressFromCourierOrderResponse
    let addressTo: AddressToCourierOrderResponse
    let transitions: Transitions
    let redistributed: Bool
    let comments, deliveryTime, customerAmount: String?

}

// MARK: - AddressFrom
struct AddressFromCourierOrderResponse: Codable {
    let address, lat, long, phone: String
}

// MARK: - AddressTo
struct AddressToCourierOrderResponse: Codable {
    let street, house: String
    let flat, addressMore: String?
    let lat, long: String
}

// MARK: - OrderItem
struct OrderItemCourierOrderResponse: Codable {
    let name: String
    let description: String?
    let quantity, price: Int
}

// MARK: - Point
struct PointCourierOrderResponse: Codable {
    let id: Int
    let name, description, lat, long: String
}

// MARK: - Transitions
struct Transitions: Codable {
    let status: Int
    let title, alertTitle, alertDescription, alertPositive: String? // Может частично не быть в экземпляре заказа
    let alertNegative: String? // Может не быть в экземпляре заказа
}

typealias CourierOrderResponse = [CourierOrderResponseElement]
