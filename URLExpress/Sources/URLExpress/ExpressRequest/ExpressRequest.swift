//
//  ExpressRequest.swift
//  DeclarativeNetworking
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

/**
 A struct that represents an HTTP request with an associated array of `HTTPBodyField` objects.

 `ExpressRequest` provides a convenient way to create and modify HTTP requests, including the request body.

 - Parameters:
    - request: The `URLRequest` object that represents the HTTP request.
    - fields: An array of `HTTPBodyField` objects that represent the fields in the HTTP request body.
 */
public struct ExpressRequest {
    var request: URLRequest
    var fields: [HTTPBodyField] = []
    
    /**
     Initializes a new `ExpressRequest` instance with the specified `URLRequest` object.
     
     - Parameters:
        - request: The `URLRequest` object that represents the HTTP request.
     */
    init(request: URLRequest) {
        self.request = request
    }
}
