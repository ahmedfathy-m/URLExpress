# Documentation

- [Introduction](#introduction)
- [Building Requests](#building-requests)
    - [URL Creation](#url-creation)
    - [URL Queries](#url-queries)
    - [Making Requests and HTTP Methods](#making-requests-with-an-http-method)
- [HTTP Headers](#http-headers)
    - [`Accept` and `Content-Type`](#accept-and-content-type)
    - [Authorization](#authorization)
        - [Using Bearer Token](#bearer)
        - [Regular Authorization](#regular)
    - [Custom Headers](#custom-headers)
- [HTTP Body Fields](#http-body-fields)
    - [Text Fields](#text-fields)
    - [Data Fields](#data-fields)
- [Decoding/Handling Actions](#decodinghandling-actions)
- [Sendable Requests](#sendable-request)
    - [`send`](#send)
    - [`sendAsPublisher()` using Combine](#sendaspublisher)

## Introduction
URLExpress acheives a declarative code via the use of two key types `ExpressRequest` and `SendableRequest<T: Codable>`
- `ExpressRequest`: is first and foremost a wrapper for a `URLRequest` object and its associated fields and has no knowledge of the return data type.
- `SendableRequest`: is a generic container that includes a `URLRequest` instance with an acoordingly-encoded `httpBody` and an assigned handling action (default is JSON decoding).

## Building Requests
### URL Creation
You can use the standard method to initialize a `URL` instance. It's still valid to use in **URLExpress**
```swift
URL(string: "https://dummyjson.com/auth/login")!
```
..or you can use custom initializer provided by **URLExpress**. It does the same thing but with a more organized syntax.
```swift
URL(domain: "https://dummyjson.com", path: "auth/login")!
```

### URL Queries
Queries and query parameters are part of the URL itself and not the request's body. So, you must add them before initializing the request.

- You can add your queries one by one using the `withQueryItem(key:value:)` method
```swift
URL(domain: "https://dummyjson.com", path: "products")!
    .withQueryItem(key: "limit", value: "10")
    .withQueryItem(key: "skip", value: "10")
    .withQueryItem(key: "select", value: "title,price")
```

- Or you can add them all at once using the `appendingQueryItems(_ parameters:)` method
```swift
URL(domain: "https://dummyjson.com", path: "products")!
    .appendingQueryItems(_ parameters:["limit": "10", "skip": "10", "select": "title,price"])
```

### Making Requests with an HTTP Method
To create a new request instance, you need to use the `makeRequest(with method:)` method
```swift
URL(domain: "https://dummyjson.com", path: "products")!
    .appendingQueryItems(_ parameters:["limit": "10", "skip": "10", "select": "title,price"])
    .makeRequest(with: HTTPMethod.get)
```
This expression returns a `ExpressRequest` instance that contains a `URLRequest` using the `URL` and the method provided.

The `HTTPMethod` enum includes the all methods defined in [RFC 7231: Section 4.3 Method Definitions](https://www.rfc-editor.org/rfc/rfc7231#section-4.3)

```swift
public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case head = "HEAD"
    case options = "OPTIONS"
    case trace = "TRACE"
    case connect = "CONNECT"
}
```

## HTTP Headers
### `Accept` and `Content-Type`
### Authorization
#### Bearer
#### Regular
### Custom Headers
## HTTP Body Fields
### Text Fields
### Data Fields
## Decoding/Handling Actions
## Sendable Request
### `send`
### `sendAsPublisher`
