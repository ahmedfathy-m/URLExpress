//
//  HTTPBodyFields.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

struct HTTPBodyField {
    var key: String
    var type: String
    var value: Data
    
    init(key: String, type: String, value: Data) {
        self.key = key
        self.type = type
        self.value = value
    }
    
    init(key: String, type: String, value: String) {
        self.key = key
        self.type = type
        self.value = value.data(using: .utf8) ?? Data()
    }
}
