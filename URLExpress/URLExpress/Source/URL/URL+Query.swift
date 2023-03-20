//
//  URL+Query.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

extension URL {
    /**
     Creates a new `URL` instance with the specified query item added to the URL.

     - Parameters:
        - key: The query item key.
        - value: The query item value.
     
     - Returns: A new `URL` instance with the specified query item added to the URL.
     */
    public func withQueryItem(key: String, value: String) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        if components?.queryItems == nil { components?.queryItems = [] }
        let item = URLQueryItem(name: key, value: value)
        components?.queryItems?.append(item)
        return (components?.url)!
    }
    
    /**
     Creates a new `URL` instance with the specified query items added to the URL.

     - Parameters:
        - parameters: A dictionary of query item keys and values.
     
     - Returns: A new `URL` instance with the specified query items added to the URL.
     */
    public func appendingQueryItems(_ parameters: [String: String]) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        if components?.queryItems == nil { components?.queryItems = [] }
        parameters.forEach {
            let item = URLQueryItem(name: $0.key, value: $0.value)
            components?.queryItems?.append(item)
        }
        return (components?.url)!
    }
}
