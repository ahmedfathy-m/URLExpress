//
//  ExpressRequest+Data.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

extension ExpressRequest {
    func toJSONData() -> Data {
        var params = [String: Any]()
        self.fields
            .filter { $0.type == "" }
            .forEach { params[$0.key] = $0.value.utf8String }
        return (try? JSONSerialization.data(withJSONObject: params)) ?? Data()
    }
    
    func toFormURLEncoded() -> Data {
        let body = self.fields
            .filter { $0.type == "text" }
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
        return body.data(using: .utf8) ?? Data()
    }
}
