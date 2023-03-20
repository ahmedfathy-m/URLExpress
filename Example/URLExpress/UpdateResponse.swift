//
//  UpdateResponse.swift
//  URLExpress_Example
//
//  Created by Ahmed Fathy on 19/03/2023.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

// MARK: - UpdateModel
struct UpdateModel: Codable {
    let userStatus, msg, key: String
    let code: Int
    let data: DataClass?

    enum CodingKeys: String, CodingKey {
        case userStatus = "user_status"
        case msg, key, code, data
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let user: User
    let hasChangedPhone: String

    enum CodingKeys: String, CodingKey {
        case user
        case hasChangedPhone = "has_changed_phone"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let name, email: String
    let completedInfo: Bool
    let countryKey, flag, phone, changedPhone: String
    let avatar: String
    let lat, long, address, rate: String
    let wallet, totalBills, totalDeliveryFees, numOrders: String
    let numComments, accType: String
    let newOrdersNotify, offersNotify: Bool
    let timeZone, date, cityID, gender: String

    enum CodingKeys: String, CodingKey {
        case id, name, email
        case completedInfo = "completed_info"
        case countryKey = "country_key"
        case flag, phone
        case changedPhone = "changed_phone"
        case avatar, lat, long, address, rate, wallet
        case totalBills = "total_bills"
        case totalDeliveryFees = "total_delivery_fees"
        case numOrders = "num_orders"
        case numComments = "num_comments"
        case accType = "acc_type"
        case newOrdersNotify = "new_orders_notify"
        case offersNotify = "offers_notify"
        case timeZone = "time_zone"
        case date
        case cityID = "city_id"
        case gender
    }
}
