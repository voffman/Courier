//
//  OrderStatusResponse.swift
//  courier
//
//  Created by Владимир Свиридов on 28.03.2022.
//

import Foundation

// MARK: - OrderStatusResponse
struct OrderStatusResponse: Codable {
     let id, companyId: Int
     let companyName, phone, customerName: String
     let status: Int
     let statusName, createdAt, updatedAt, setCourierDateTime: String
     let orderItems: [OrderItemOrderStatusResponse]
     let sumItems, deliveryPrice: Int
     let dateTimeFinish: String
     let correctionalPrice, sumTotal, paymentTypeId: Int
     let addressFrom: AddressFromOrderStatusResponse
     let addressTo: AddressToOrderStatusResponse
     let redistributed: Bool
 }

 // MARK: - AddressFrom
 struct AddressFromOrderStatusResponse: Codable {
     let address, lat, long, phone: String
 }

 // MARK: - AddressTo
 struct AddressToOrderStatusResponse: Codable {
     let street, house, flat, addressMore: String?
     let lat, long: String
 }

 // MARK: - OrderItem
 struct OrderItemOrderStatusResponse: Codable {
     let name: String
     let description: String?
     let quantity, price: Int
 }
