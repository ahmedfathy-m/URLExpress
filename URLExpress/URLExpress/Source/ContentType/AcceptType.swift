//
//  AcceptType.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 19/03/2023.
//

import Foundation

/**
 An enumeration of commonly used Accept types in HTTP requests.
 */
public enum AcceptType: String {
    /// The MIME type for JSON data, which is commonly used for sending and receiving structured data in HTTP requests and responses.
    case json = "application/json"
    /// The MIME type for XML data, which is commonly used for sending and receiving structured data in HTTP requests and responses.
    case xml = "application/xml"
    /// The MIME type for HTML data, which is commonly used for sending and receiving web pages and other web content in HTTP requests and responses.
    case html = "text/html"
    /// The MIME type for plain text data, which is commonly used for sending and receiving simple text data in HTTP requests and responses.
    case plainText = "text/plain"
    /// The MIME type for URL-encoded form data, which is a common format for submitting HTML form data over HTTP.
    case formUrlEncoded = "application/x-www-form-urlencoded"
    /// The MIME type for binary data, which is commonly used for sending and receiving non-textual data in HTTP requests and responses.
    case octetStream = "application/octet-stream"
    /// The MIME type for any type of data, and is commonly used to indicate that the client is willing to accept any type of data in the response.
    case any = "*/*"
}
