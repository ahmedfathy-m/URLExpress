//
//  URL+Query.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

extension URL {
    public func withQueryItem(key: String, value: String) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        if components?.queryItems == nil { components?.queryItems = [] }
        let item = URLQueryItem(name: key, value: value)
        components?.queryItems?.append(item)
        return (components?.url)!
    }
    
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
