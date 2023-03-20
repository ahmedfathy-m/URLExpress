//
//  SendableRequest.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

/// An object that wraps the request whether it's a simple decoding action or containse additional processing.
public struct SendableRequest<T: Codable> {
    private var processingAction: (Data?, URLResponse?) throws -> T
    private var request: URLRequest
    
    init(processingAction: @escaping (Data?, URLResponse?) throws -> T, config: ExpressRequest) {
        self.processingAction = processingAction
        var request = config.request
        let contentType = ContentType(rawValue: config.request.value(forHTTPHeaderField: "Content-Type") ?? "")
        switch contentType {
        case .json:
            request.httpBody = config.toJSONData()
        case .formData:
            let boundary = UUID().uuidString
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            request.httpBody = config.generateMultiPartData(boundary: boundary)
        case .formURLEncoded:
            request.httpBody = config.toFormURLEncoded()
        case .none: break
        }
        self.request = request

    }
    
    /// ٍSends the request to the network and decodes the retrieved response immediately.
    /// - Parameters:
    ///   - failure: The action to be executed in case of error with the error as an argument.
    ///   - success: The action to be executed in case of success with the retrieved response as an argument.
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
