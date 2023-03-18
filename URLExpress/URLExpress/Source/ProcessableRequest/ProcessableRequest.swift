//
//  ProcessableRequest.swift
//  DeclarativeNetworking
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

public struct ProcessableRequest<T: Codable> {
    private var processingAction: (Data?, URLResponse?) throws -> T
    private var request: URLRequest
    
    init(processingAction: @escaping (Data?, URLResponse?) throws -> T, config: ConfigurableRequest) {
        self.processingAction = processingAction
        var request = config.request
        let contentType = ContentType(rawValue: config.request.value(forHTTPHeaderField: "Content-Type") ?? "")
        switch contentType {
        case .json:
            request.httpBody = config.toJSONData()
        case .formData:
            break
        case .formURLEncoded:
            request.httpBody = config.toFormURLEncoded()
        case .none: break
        }
        self.request = request
    }
    
    public func send(failure: @escaping (Error)->Void, success: @escaping (T)->Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async { failure(error!) }
                return
            }
            do {
                let model = try self.processingAction(data, response)
                DispatchQueue.main.async { success(model) }
            } catch {
                DispatchQueue.main.async { failure(error) }
            }
        }.resume()
    }
}
