//
//  ConfigurableRequest+Accept.swift
//  DeclarativeNetworking
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

// MARK: - Request + AcceptType
extension ConfigurableRequest {
    public func withAcceptType(_ type: String) -> ConfigurableRequest {
        var wrapper = self
        wrapper.request.setValue(type, forHTTPHeaderField: "Accept")
        return wrapper
    }
    
    public func withContentType(_ type: ContentType) -> ConfigurableRequest {
        var wrapper = self
        wrapper.request.setValue(type.rawValue, forHTTPHeaderField: "Content-Type")
        return wrapper
    }
}
