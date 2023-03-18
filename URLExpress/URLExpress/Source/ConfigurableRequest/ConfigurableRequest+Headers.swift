//
//  ConfigurableRequest+Auth.swift
//  DeclarativeNetworking
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

extension ConfigurableRequest {
    public func withBearerToken(_ token: String) -> ConfigurableRequest {
        var wrapper = self
        wrapper.request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return wrapper
    }
    
    public func withAuthorizationHeaer(_ value: String) -> ConfigurableRequest {
        var wrapper = self
        wrapper.request.setValue(value, forHTTPHeaderField: "Authorization")
        return wrapper
    }
    
    public func withHeaderField(_ field: String, value: String) -> ConfigurableRequest {
        var wrapper = self
        wrapper.request.setValue(value, forHTTPHeaderField: field)
        return wrapper
    }
}
