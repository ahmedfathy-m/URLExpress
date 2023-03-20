//
//  ExpressRequest+Combine.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation
import Combine

extension ExpressRequest {
    /**
     Returns a `URLSession.DataTaskPublisher` instance that sends a request to the URLRequest contained in the `ExpressRequest` object.

     - Returns: A `URLSession.DataTaskPublisher` instance that sends a request to the URLRequest contained in the `ExpressRequest` object.
     */
    public var dataTaskPublisher: URLSession.DataTaskPublisher {
        return URLSession.shared.dataTaskPublisher(for: self.request)
    }
}
