//
//  ExpressRequest+Accept.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 14/03/2023.
//

import Foundation

extension ExpressRequest {
    /// Filters the response data and only retrieves the selected format.
    ///
    /// If you set the accept type to `application/json` for example. You'll only be able to retrieve json data.
    /// If the response has xml data passed along with it, it won't be intercepted.
    /// - Parameter type: The desired request return type.
    /// - Returns: The same request with a defined rule for accept type.
    public func withAcceptType(_ type: AcceptType) -> ExpressRequest {
        var wrapper = self
        wrapper.request.setValue(type.rawValue, forHTTPHeaderField: "Accept")
        return wrapper
    }
    
    /// Sets the allowable type of the request's payload.
    ///
    /// By type, we don't actually mean whether it's an image or an audio file, but rather, the encoding of the body fields.
    /// - `application/json`: converts the key/value pairs to a json object.
    /// - `application/x-www-form-urlencoded`: combines each key/value pair with a `=` sign and joins the resulting group with a `&` sign.
    /// - `multipart/form-data`: Needed for uploading non-textual data like images and audio files or any different type.
    /// - Parameter type: The allowable type of data you can send with
    /// - Returns: The same request with a defined rule for the Content-Type and the httpBody encoding
    public func withContentType(_ type: ContentType) -> ExpressRequest {
        var wrapper = self
        wrapper.request.setValue(type.rawValue, forHTTPHeaderField: "Content-Type")
        return wrapper
    }
}
