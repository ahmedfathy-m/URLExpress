//
//  ProcessingAction.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 19/03/2023.
//

import Foundation

/// A processing action that returns a decoded response but you can add custom handling to it.
typealias ProcessingAction<T: Codable> = (Data?, URLResponse?) throws -> T
