//
//  HTTPMethod.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

/**
 An enumeration of standard HTTP methods.
 */
public enum HTTPMethod: String {
    /// The HTTP GET method, which retrieves information from the server.
    case get = "GET"
    /// The HTTP POST method, which sends data to be processed by the server.
    case post = "POST"
    /// The HTTP PUT method, which replaces or updates an existing resource on the server.
    case put = "PUT"
    /// The HTTP PATCH method, which updates a specific part of an existing resource on the server.
    case patch = "PATCH"
    /// The HTTP DELETE method, which deletes a resource on the server.
    case delete = "DELETE"
    /// The HTTP HEAD method, which retrieves the headers of a resource without actually retrieving the resource itself.
    case head = "HEAD"
    /// The HTTP OPTIONS method, which retrieves information about the communication options available for a resource.
    case options = "OPTIONS"
    /// The HTTP TRACE method, which retrieves a diagnostic trace of the request and response messages for a resource.
    case trace = "TRACE"
    /// The HTTP CONNECT method, which establishes a network connection to a server using a specific protocol.
    case connect = "CONNECT"
}
