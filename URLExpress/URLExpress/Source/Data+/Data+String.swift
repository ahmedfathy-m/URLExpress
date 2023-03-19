//
//  Data+String.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 19/03/2023.
//

import Foundation

extension Data {
    var utf8String: String {
        return String(data: self, encoding: .utf8) ?? ""
    }
}
