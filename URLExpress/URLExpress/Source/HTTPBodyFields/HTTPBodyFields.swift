//
//  HTTPBodyFields.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

/**
 A structure representing a field in an HTTP request body.
 */
struct HTTPBodyField {
    /// The name of the field in the request body.
    var key: String
    /// The MIME type of the data in the field.
    var type: String
    /// The data contained in the field.
    var value: Data

    /**
     Initializes a new `HTTPBodyField` instance with the specified key, type, and value.

     - Parameters:
        - key: The name of the field in the request body.
        - type: The MIME type of the data in the field.
        - value: The data contained in the field.
     */
    init(key: String, type: String, value: Data) {
        self.key = key
        self.type = type
        self.value = value
    }
    
    /**
     Initializes a new `HTTPBodyField` instance with the specified key, type, and string value.

     - Parameters:
        - key: The name of the field in the request body.
        - type: The MIME type of the data in the field.
        - value: The string value contained in the field.
     */
    init(key: String, type: String, value: String) {
        self.key = key
        self.type = type
        self.value = value.data(using: .utf8) ?? Data()
    }
}
