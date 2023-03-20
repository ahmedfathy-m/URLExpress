//
//  Login.swift
//  URLExpress_Example
//
//  Created by Ahmed Fathy on 19/03/2023.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

struct Login: Codable {
    let id: Int
    let username, email, firstName, lastName: String
    let gender: String
    let image: String
    let token: String
}
