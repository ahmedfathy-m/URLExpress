//
//  ExpressRequest+Auth.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

extension ExpressRequest {
    /// Sets the authorization field in the HTTPHeaders with the bearer token and takes care of adding the "Bearer " prefix
    /// - Parameter token: The bearer token required for the authorization without the "Bearer " prefix. It's taken care of.
    /// - Returns: An authorized version of the same request.
    public func withBearerToken(_ token: String) -> ExpressRequest {
        var wrapper = self
        wrapper.request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return wrapper
    }
    
    /// Sets the value for the authorization header. Useful for non-bearer authorization like OAuth 1.0.
    /// - Parameter value: The authorization header value.
    /// - Returns: An authorized version of the same request.
    public func withAuthorizationHeaer(_ value: String) -> ExpressRequest {
        var wrapper = self
        wrapper.request.setValue(value, forHTTPHeaderField: "Authorization")
        return wrapper
    }
    
    /// Sets a value for any header field you define.
    /// - Parameters:
    ///   - field: The field that you want to set the value for
    ///   - value: The value you want to assign for the header
    /// - Returns: The same request with applied header.
    public func withHeaderField(_ field: String, value: String) -> ExpressRequest {
        var wrapper = self
        wrapper.request.setValue(value, forHTTPHeaderField: field)
        return wrapper
    }
}
