//
//  ContentType.swift
//  DeclarativeNetworking
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

public enum ContentType: String {
    case json = "application/json"
    case formData = "multipart/form-data"
    case formURLEncoded = "application/x-www-form-urlencoded"
}
