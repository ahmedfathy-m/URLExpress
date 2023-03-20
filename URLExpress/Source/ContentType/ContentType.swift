//
//  ContentType.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

/**
 An enumeration of commonly used content types in HTTP requests.
 */
public enum ContentType: String {
    /// The MIME type for JSON data, which is commonly used for sending and receiving structured data in HTTP requests and responses.
    case json = "application/json"
    /// The MIME type for submitting forms with binary data, such as file uploads.
    case formData = "multipart/form-data"
    /// The MIME type for submitting forms with URL-encoded data, which is a common format for submitting HTML form data over HTTP.
    case formURLEncoded = "application/x-www-form-urlencoded"
}
