//
//  ExpressRequest+Fields.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

extension ExpressRequest {
    /// Adds a single text field to the request
    /// - Parameters:
    ///   - field: The key or the parameter name.
    ///   - value: The textual representation of the value.
    /// - Returns: The same request with a key/value pair representative of a single item of the request's payload.
    public func appendingTextField(_ field: String, value: String) -> ExpressRequest {
        var wrapper = self
        wrapper.fields.append(HTTPBodyField(key: field, type: "text", value: value))
        return wrapper
    }
    
    /// Adds multiple text fields to the request
    /// - Parameter fields: A dictionary grouping multiple key/value pairs representing the textual payload of the request.
    /// - Returns: The same request with multiple key/value pair representative of the request's payload.
    public func appendingTextFields(_ fields: [String: String]) -> ExpressRequest {
        var wrapper = self
        fields.forEach { wrapper.fields.append(HTTPBodyField(key: $0.key, type: "text", value: $0.value)) }
        return wrapper
    }
    
    /// Adds a single data field to the request.
    ///
    /// - Note that datafields are only valid in case of a `multipart/form-data` request.
    /// - Non-textual data fields won't be encoded into the URLRequest's body before sending it.
    /// - Parameters:
    ///   - field: The name of the parameter or the key.
    ///   - type: The mime type of the data.
    ///   - value: The data you need to upload whether it be images, audio files, anything you wouldn't send as a plain text.
    /// - Returns: The same request paired with the passed datafield.
    public func appendingDataField(_ field: String, type: String, value: Data) -> ExpressRequest {
        var wrapper = self
        wrapper.fields.append(HTTPBodyField(key: field, type: type, value: value))
        return wrapper
    }
}
