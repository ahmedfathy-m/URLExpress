//
//  NSMutableData+String.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 19/03/2023.
//

import Foundation

extension NSMutableData {
    /**
     Appends the specified string to the `NSMutableData` object, converting it to a `Data` object using the UTF-8 encoding.

     - Parameters:
        - string: The string to append to the `NSMutableData` object.
     */
    func append(_ string: String) {
        self.append(string.data(using: .utf8) ?? Data())
    }
}
