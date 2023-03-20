//
//  URL+ExpressRequest.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

extension URL {
    /**
     Creates a new `ExpressRequest` instance with the specified HTTP method.

     - Parameters:
        - method: The HTTP method to use for the request.
     
     - Returns: A new `ExpressRequest` instance with the specified HTTP method.
     */
    public func makeRequest(with method: HTTPMethod) -> ExpressRequest {
        var request = URLRequest(url: self)
        request.httpMethod = method.rawValue
        return ExpressRequest(request: request)
    }
}
