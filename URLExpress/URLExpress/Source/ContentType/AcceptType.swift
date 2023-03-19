//
//  AcceptType.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 19/03/2023.
//

import Foundation

public enum AcceptType: String {
    case json = "application/json"
    case xml = "application/xml"
    case html = "text/html"
    case plainText = "text/plain"
    case formUrlEncoded = "application/x-www-form-urlencoded"
    case octetStream = "application/octet-stream"
    case any = "*/*"
    
    var value: String {
        return rawValue
    }
}
