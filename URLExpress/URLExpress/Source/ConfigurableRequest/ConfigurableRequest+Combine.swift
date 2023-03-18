//
//  ConfigurableRequest+Combine.swift
//  DeclarativeNetworking
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation
import Combine

extension ConfigurableRequest {
    public func dataTaskPublisher() -> URLSession.DataTaskPublisher {
        return URLSession.shared.dataTaskPublisher(for: self.request)
    }
}
