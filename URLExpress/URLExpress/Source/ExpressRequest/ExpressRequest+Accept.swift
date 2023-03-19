//
//  ExpressRequest+Accept.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

extension ExpressRequest {
    public func withAcceptType(_ type: AcceptType) -> ExpressRequest {
        var wrapper = self
        wrapper.request.setValue(type.rawValue, forHTTPHeaderField: "Accept")
        return wrapper
    }
    
    public func withContentType(_ type: ContentType) -> ExpressRequest {
        var wrapper = self
        wrapper.request.setValue(type.rawValue, forHTTPHeaderField: "Content-Type")
        return wrapper
    }
}
