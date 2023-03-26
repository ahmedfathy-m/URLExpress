# Documentation

- [Introduction](#introduction)
- [Building Requests](#building-requests)
    - [URL Creation](#url-creation)
    - [URL Queries](#url-queries)
    - [Making Requests and HTTP Methods](#making-requests-with-an-http-method)
- [HTTP Headers](#http-headers)
    - [`Accept` and `Content-Type`](#content-type-and-accept)
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
**URLExpress** provides easy and direct access to the values of HTTP headers in a URLRequest 

### `Content-Type` and `Accept`
You can control how the the body of your HTTP request will be encoded by defining the value of the `Content-Type` using `withContentType(_ type:)`

```swift
URL(domain: "https://dummyjson.com", path: "auth/login")!
    .makeRequest(with: .post)
    .appendingTextField("username", value: "kminchelle")
    .appendingTextField("password", value: "0lelplR")
    .withContentType(.json)
```

Adding the line `withContentType(.json)`, formats the text fields as a JSON object

```json
{
    "username": "kminchelle",
    "password": "0lelplR"
}

```
We'll get into encoding an HTTP request's body more in [HTTP Body Fields](#http-body-fields)

You can choose a `Content-Type` header value from the `ContentType` enum

```swift
public enum ContentType: String {
    case json = "application/json"
    case formData = "multipart/form-data"
    case formURLEncoded = "application/x-www-form-urlencoded"
}
```

Similarly, you can assign a value for the value of the header `Accept` using the `withAcceptType(_ type:)` method by passing a value from the `AcceptType` enum as an arguemnt

```swift
public enum AcceptType: String {
    case json = "application/json"
    case xml = "application/xml"
    case html = "text/html"
    case plainText = "text/plain"
    case formUrlEncoded = "application/x-www-form-urlencoded"
    case octetStream = "application/octet-stream"
    case any = "*/*"
}
```

### Authorization
**URLExpress** provides similarly easy access to the value of the `Authorization` header 

#### Bearer
You can provide a bearer token without adding the "Bearer " prefix to the token when adding it to the request by using `withBearerToken(_ token)` and passing the token directly as an argument
```swift
URL(domain: "https://dummyjson.com", path: "posts")!
    .makeRequest(with: .get)
    .withBearerToken("[GENERATED_USER_TOKEN]")
```

#### Regular
If your authorization header isn't using a bearer token (e.g. OAuth 1.0) you can still just access the value of the `Authorization` header directly using the `withAuthorizationHeaer(_ value:)`
```swift
URL(domain: "https://api.twitter.com", path: "1.1/statuses/update.json")!
    .withQueryItem(key: "status", value: "Hello world")
    .makeRequest(with: .post)
    .withAuthorizationHeader("OAuth oauth_consumer_key=\"CONSUMER_API_KEY\", oauth_nonce=\"OAUTH_NONCE\", oauth_signature=\"OAUTH_SIGNATURE\", oauth_signature_method=\"HMAC-SHA1\", oauth_timestamp=\"OAUTH_TIMESTAMP\", oauth_token=\"ACCESS_TOKEN\", oauth_version=\"1.0\"")
```

### Custom Headers
There are obviously other headers that you can use based on the nature of your API. Not to worry, you can use `withHeaderField(_ field: value:)` to assign a value for a custom header

```swift
URL(domain: "https://dummyjson.com", path: "posts")!
    .makeRequest(with: .get)
    .withHeaderField("Lang" ,value:"en")
```

## HTTP Body Fields
This framework allows you to configure the request's payload and encode it based on the value of the `Content-Type` header

- `application/json` and `application/x-www-form-urlencoded` are useful for text fields.
- `multipart/form-data` is your go-to move if you're trying to upload non-textual data like image files, audio or any other format.

However, these fields are stored in the `ExpressRequest` instance and doesn't get injected in the `URLRequest` until the initialization of the `SendableRequest` instance.

When that happens, the fields are encoded accordingly and injected into the `httpBody` of the `URLRequest`

### Text Fields
You can add a text field to the request by using the `appendingTextField(_ field: value:)` method to add a single field/value pair.

```swift
URL(domain: "https://dummyjson.com", path: "auth/login")!
    .makeRequest(with: .post)
    .appendingTextField("username", value: "kminchelle")
    .appendingTextField("password", value: "0lelplR")
    .withContentType(.json)
```

..or `appendingTextFields(_ fields:)` to add multiple fields at once.

```swift
URL(domain: "https://dummyjson.com", path: "auth/login")!
    .makeRequest(with: .post)
    .appendingTextFields(["username": "kminchelle" ,"password": "0lelplR"])
    .withContentType(.json)
```

### Data Fields
If you need to upload an image, audio, video or any other type of non-textual data, you'll need to use `appendingDataField(_ field: type: value:)`

```swift
URL(domain: "https://not-a-real-website.com", path: "upload")!
    .makeRequest(with: .post)
    .appendingTextField("user_ID", value: "23")
    .appendingDataField("image", type:"image/jpeg", value: someImageJPEGData)
    .withContentType(.formData)
```

*NOTE: If you use `ContentType.json` or `ContentType.formURLEncoded` on a request with non-textual data fields, the data fields will be ignored and only the textual fields will be encoded.*

## Decoding/Handling Actions
Nine times out of ten when you retrieve a response from the API, it'll be a JSON object and you'll wanna decode it as such. In which case, you'll need to assign a JSON decoding action to the request using `decodeJSONOnReceive(for:)` before you send it

```swift
URL(domain: "https://dummyjson.com", path: "auth/login")!
    .makeRequest(with: .post)
    .appendingTextField("username", value: "kminchelle")
    .appendingTextField("password", value: "0lelplR")
    .withContentType(.json)
    .withAcceptType(.json)
    .decodeJSONOnReceive(for: Login.self)
```  

You might say "What if I don't need to decode it as JSON? Maybe the response is a plain text. or maybe the response is a JSON but it has a bunch of extra data that I need to ignore".

Not to worry. For custom response processing, you can use `tryHandleOnReceive(for:_:)` instead. You provide a return type and a custom throwing action and it gets triggered automatically when the app receives a response.

```swift
URL(domain: "https://dummyjson.com", path: "auth/login")!
    .makeRequest(with: .post)
    .appendingTextField("username", value: "kminchelle")
    .appendingTextField("password", value: "0lelplR")
    .withContentType(.json)
    .withAcceptType(.json)
    .tryHandleOnReceive(for: String.self) { data, response in
        guard let string = String(data: data!, encoding: .utf8) else { throw someError }
        return string
    }
```

## Sendable Request
- The main difference between an `ExpressRequest` and a `SendableRequest` is that the `ExpressRequest` merely describes the request but it doesn't know how to process it. You might wanna add more attributes and more details to the request.
- When you give it a **decoding** or **handling** action, it becomes locked and ready to send. You can't add more properties or statements you just send it.

### `send`
This one is clear enough. You call `send(failure:success:)` and tells the app what to do when the request fails and what to do when it succeeds.

```swift
    // ...some request
    .decodeJSONOnReceive(for: Login.self)
    .send { error in
        // In case of failure
        print(error)
    } success: { decodedData in
        // In case of success
        print(decodedData)
    }
```

### `sendAsPublisher`
If you want to use it with `Combine`, you can use `sendAsPublisher()` to return `AnyPublisher<T, Error>` where `T` is the decoded return type.

```swift
    // ...some request
    .decodeJSONOnReceive(for: Login.self)
    .sendAsPublisher()
    .sink { completion in
        if case let .failure(error) = completion {
            print(error)
        }
    } receiveValue: { decodedData in
        print(decodedData)
    }.store(in: &cancellables)
```
