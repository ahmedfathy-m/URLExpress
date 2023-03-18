//
//  URL+ConfigurableRequest.swift
//  DeclarativeNetworking
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

extension URL {
    public func makeRequest(with method: HTTPMethod) -> ConfigurableRequest {
        var request = URLRequest(url: self)
        request.httpMethod = method.rawValue
        return ConfigurableRequest(request: request)
    }
}
