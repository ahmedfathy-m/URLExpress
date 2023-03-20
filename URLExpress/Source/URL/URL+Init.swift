//
//  URL+Init.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

public extension URL {
    /**
     Initializes a new `URL` instance with the specified domain and path.

     - Parameters:
        - domain: The domain of the URL.
        - path: The path of the URL.
     
     - Returns: A new `URL` instance, or `nil` if the URL string is invalid.
     */
    init?(domain: String, path: String) {
        self.init(string: "\(domain)/\(path)")
    }
}
