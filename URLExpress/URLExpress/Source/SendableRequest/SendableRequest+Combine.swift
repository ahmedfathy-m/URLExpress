//
//  SendableRequest+Combine.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation
import Combine

extension SendableRequest {
    public func requestPublisher() -> AnyPublisher<T, Error> {
        return Future { promise in
            send {
                promise(.failure($0))
            } success: {
                promise(.success($0))
            }
        }.eraseToAnyPublisher()
    }
}
