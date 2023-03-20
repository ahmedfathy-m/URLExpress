//
//  ExpressRequest+Combine.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation
import Combine

extension ExpressRequest {
    /// Returns a publisher that wraps a URL session data task for the requst
    public var dataTaskPublisher: URLSession.DataTaskPublisher {
        return URLSession.shared.dataTaskPublisher(for: self.request)
    }
}
