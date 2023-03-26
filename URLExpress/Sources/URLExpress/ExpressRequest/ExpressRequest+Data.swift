//
//  ExpressRequest+Data.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

extension ExpressRequest {
    /**
     Returns a `Data` object that represents the HTTP request body as JSON data.

     - Returns: A `Data` object that represents the HTTP request body as JSON data.
     */
    func toJSONData() -> Data {
        var params = [String: Any]()
        self.fields
            .filter { $0.type == "text" }
            .forEach { params[$0.key] = $0.value.utf8String }
        return (try? JSONSerialization.data(withJSONObject: params)) ?? Data()
    }
    
    /**
     Returns a `Data` object that represents the HTTP request body as URL-encoded form data.

     - Returns: A `Data` object that represents the HTTP request body as URL-encoded form data.
     */
    func toFormURLEncoded() -> Data {
        let body = self.fields
            .filter { $0.type == "text" }
            .map { "\($0.key)=\($0.value.utf8String)" }
            .joined(separator: "&")
        return body.data(using: .utf8) ?? Data()
    }
}
