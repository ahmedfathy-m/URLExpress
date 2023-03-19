//
//  ProcessingAction.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 19/03/2023.
//

import Foundation

typealias ProcessingAction<T: Codable> = (Data?, URLResponse?) throws -> T
