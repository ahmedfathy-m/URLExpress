//
//  ConfigurableRequest+Decode.swift
//  DeclarativeNetworking
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

// MARK: - Request + Decode

typealias ProcessingAction<T: Codable> = (Data?, URLResponse?) throws -> T

extension ConfigurableRequest {
    public func decodeOnReceive<T: Codable>(for type: T.Type) -> ProcessableRequest<T> {
        let decode: ProcessingAction<T> = { data, _ in
            return try JSONDecoder().decode(type.self, from: data ?? Data())
        }
        return ProcessableRequest(processingAction: decode, config: self)
    }
    
    public func tryHandleOnReceive<T: Codable>(for type: T.Type, _ process: @escaping (Data?, URLResponse?) throws -> T) -> ProcessableRequest<T> {
        return ProcessableRequest(processingAction: process, config: self)
    }
}
