//
//  ExpressRequest.swift
//  DeclarativeNetworking
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

public struct ExpressRequest {
    var request: URLRequest
    var fields: [HTTPBodyField] = []
    
    init(request: URLRequest) {
        self.request = request
    }
}
