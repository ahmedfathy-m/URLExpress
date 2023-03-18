//
//  ConfigurableRequest+Data.swift
//  DeclarativeNetworking
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

extension ConfigurableRequest {
    func toJSONData() -> Data {
        var params = [String: Any]()
        self.fields.forEach { params[$0.key] = String(data: $0.value, encoding: .utf8) }
        return (try? JSONSerialization.data(withJSONObject: params)) ?? Data()
    }
    
    func toFormURLEncoded() -> Data {
        let body = self.fields.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
        return body.data(using: .utf8) ?? Data()
    }
}
