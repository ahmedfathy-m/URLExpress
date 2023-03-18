//
//  URL+Init.swift
//  DeclarativeNetworking
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

public extension URL {
    init?(domain: String, path: String) {
        self.init(string: "\(domain)/\(path)")
    }
}
