//
//  ExpressRequest+Multipart.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 19/03/2023.
//

import Foundation

extension ExpressRequest {
    func generateMultiPartData(boundary: String) -> Data {
        let httpBody = NSMutableData()
        self.fields.forEach {
            if $0.type == "text" {
                var fieldString = "--\(boundary)\r\n"
                fieldString += "Content-Disposition: form-data; name=\"\($0.key)\"\r\n"
                fieldString += "Content-Type: text/plain; charset=ISO-8859-1\r\n"
                fieldString += "Content-Transfer-Encoding: 8bit\r\n"
                fieldString += "\r\n"
                fieldString += "\($0.value.utf8String)\r\n"
                httpBody.append(fieldString)
            } else {
                let fieldData = NSMutableData()
                fieldData.append("--\(boundary)\r\n")
                fieldData.append("Content-Disposition: form-data; name=\"\($0.key)\"; filename=\"\(Date().timeIntervalSince1970)\"\r\n")
                fieldData.append("Content-Type: \($0.type)\r\n\r\n")
                fieldData.append($0.value)
                fieldData.append("\r\n")
                httpBody.append(fieldData as Data)
            }
        }
        httpBody.append("--\(boundary)--")
        return httpBody as Data
    }
}
