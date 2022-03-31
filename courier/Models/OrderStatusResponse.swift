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
     let statusName, createdAt, updatedAt, setCourierDateTime: String
     let orderItems: [OrderItem]
     let sumItems, deliveryPrice: Int
     let dateTimeFinish: String
     let correctionalPrice, sumTotal, paymentTypeID: Int
     let addressFrom: AddressFrom
     let addressTo: AddressTo
     let redistributed: Bool

     enum CodingKeys: String, CodingKey {
         case id
         case companyID = "companyId"
         case companyName, phone, customerName, status, statusName, createdAt, updatedAt, setCourierDateTime, orderItems, sumItems, deliveryPrice, dateTimeFinish, correctionalPrice, sumTotal
         case paymentTypeID = "paymentTypeId"
         case addressFrom, addressTo, redistributed
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
     let name: String
     let orderItemDescription: String?
     let quantity, price: Int

     enum CodingKeys: String, CodingKey {
         case name
         case orderItemDescription = "description"
         case quantity, price
     }
 }
