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
    let externalId: String?
    let companyId: Int
    let companyName, phone, customerName: String
    let status: Int
    let statusName: String
    let point: PointHistory
    let createdAt, updatedAt, setCourierDateTime: String
    let orderItems: [OrderItemHistory]
    let sumItems: Int?
    let deliveryPrice: Int
    let deliveryTime: String?
    let dateTimeFinish: String
    let correctionalPrice, sumTotal, paymentTypeId: Int
    let addressFrom: AddressFromHistory
    let addressTo: AddressToHistory
    let comments, customerAmount: String?
    let redistributed: Bool

}

// MARK: - AddressFrom
struct AddressFromHistory: Codable {
    let address, lat, long, phone: String
}

// MARK: - AddressTo
struct AddressToHistory: Codable {
    let street, house, lat, long: String
    let flat: String?
}

// MARK: - OrderItem
struct OrderItemHistory: Codable {
    let name: String
    let quantity, price: Int
}

// MARK: - Point
struct PointHistory: Codable {
    let id: Int
    let name, description, lat, long: String

}

typealias History = [HistoryElement]
