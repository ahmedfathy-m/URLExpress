//
//  ConfigurableRequest+Fields.swift
//  DeclarativeNetworking
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

extension ConfigurableRequest {
    public func appendingTextField(_ field: String, value: String) -> ConfigurableRequest {
        var wrapper = self
        wrapper.fields.append(HTTPBodyField(key: field, type: "text", value: value))
        return wrapper
    }
    
    public func appendingTextFields(_ fields: [String: String]) -> ConfigurableRequest {
        var wrapper = self
        fields.forEach { wrapper.fields.append(HTTPBodyField(key: $0.key, type: "text", value: $0.value)) }
        return wrapper
    }
    
    public func appendingDataField(_ field: String, type: String, value: Data) -> ConfigurableRequest {
        var wrapper = self
        wrapper.fields.append(HTTPBodyField(key: field, type: type, value: value))
        return wrapper
    }
}
