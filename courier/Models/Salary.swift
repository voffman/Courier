//
//  Salary.swift
//  courier
//
//  Created by Владимир Свиридов on 22.04.2022.
//

import Foundation

struct Salary: Codable {
    let countSuccessOrders, workHours, hoursAmount, orderAmount: Double?
    let penaltyAmount, totalAmount, bonusAmount, balance: Double?
    let cashDeliveryAmount, holdingAmount, distance : Double?
}

// typealias Salary = [String: Double]
