//
//  NSMutableData+String.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 19/03/2023.
//

import Foundation

extension NSMutableData {
    func append(_ string: String) {
        self.append(string.data(using: .utf8) ?? Data())
    }
}
