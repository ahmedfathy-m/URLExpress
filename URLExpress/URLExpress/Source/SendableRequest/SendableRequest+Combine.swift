//
//  SendableRequest+Combine.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation
import Combine

extension SendableRequest {
    /// Sends the request and retrieves a publisher of the result
    /// - Returns: The network response as a publisher of the model type
    public func sendAsPublisher() -> AnyPublisher<T, Error> {
        return Future { promise in
            send {
                promise(.failure($0))
            } success: {
                promise(.success($0))
            }
        }.eraseToAnyPublisher()
    }
}
