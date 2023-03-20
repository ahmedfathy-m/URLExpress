//
//  Data+String.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 19/03/2023.
//

import Foundation

extension Data {
    /**
     Returns a `String` object that represents the contents of the `Data` object, interpreted as UTF-8 encoded text.

     - Returns: A `String` object that represents the contents of the `Data` object, interpreted as UTF-8 encoded text.
     */
    var utf8String: String {
        return String(data: self, encoding: .utf8) ?? ""
    }
}
