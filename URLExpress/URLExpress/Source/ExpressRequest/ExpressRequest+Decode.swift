//
//  ExpressRequest+Decode.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

extension ExpressRequest {
    /// Decodes the request's response on receiving it.
    /// - Parameter type: The type of the value to decode from the supplied JSON object.
    /// - Returns: A SendableRequest objects that could be fired and decoded immediately.
    public func decodeOnReceive<T: Codable>(for type: T.Type) -> SendableRequest<T> {
        let decode: ProcessingAction<T> = { data, _ in
            return try JSONDecoder().decode(type.self, from: data ?? Data())
        }
        return SendableRequest(processingAction: decode, config: self)
    }
    
    /// Processes the request's response on receiving it.
    /// - Parameters:
    ///   - type: The type of the value to decode from the supplied JSON object.
    ///   - process: A custom processing action.
    /// - Returns: A SendableRequest objects that could be fired and processed immediately.
    public func tryHandleOnReceive<T: Codable>(for type: T.Type, _ process: @escaping (Data?, URLResponse?) throws -> T) -> SendableRequest<T> {
        return SendableRequest(processingAction: process, config: self)
    }
}
