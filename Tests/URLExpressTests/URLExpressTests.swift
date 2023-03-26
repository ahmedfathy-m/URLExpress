import XCTest
@testable import URLExpress

final class URLExpressTests: XCTestCase {
    // MARK: - URL initializer
    func testURLinit() {
        let newURLinit = URL(domain: "https://example.com", path: "path")
        let oldURLinit = URL(string: "https://example.com/path")
        XCTAssertEqual(newURLinit, oldURLinit)
    }
    
    // MARK: - Bearer Token
    func testWithBearerToken() {
        let token = "my-token"
        let request = URL(string: "https://example.com")!
                        .makeRequest(with: .get)
        let requestWithToken = request.withBearerToken(token)
        XCTAssertEqual(requestWithToken.request.value(forHTTPHeaderField: "Authorization"), "Bearer \(token)")
    }
    
    // MARK: - URLQueries
    func testAppendingURLQueries() {
        let url = URL(string: "https://www.google.com/search")!
                    .withQueryItem(key: "q", value: "abstract api")
        let queryURL = URL(string: "https://www.google.com/search?q=abstract%20api")!
        XCTAssertEqual(url, queryURL)
    }
    
    func testAppendingMultipleURLQueries() {
        let originalURL = URL(string: "https://api.github.com/search/users")!
                    .appendingQueryItems(["q":"ahmedfathy-m","per_page": "30"])
        let originalQueryItems = URLComponents(url: originalURL, resolvingAgainstBaseURL: true)?.queryItems?.sorted { $0.name > $1.name }
        
        let targetURL = URL(string: "https://api.github.com/search/users?q=ahmedfathy-m&per_page=30")!
        let targetQueryItems = URLComponents(url: targetURL, resolvingAgainstBaseURL: true)?.queryItems?.sorted { $0.name > $1.name }
        
        XCTAssertEqual(originalQueryItems, targetQueryItems)
    }
    
    // MARK: - HTTP Body Fields
    func testJSONEncoding() {
        let request = URL(domain: "https://example.com", path: "path")!
                            .makeRequest(with: .post)
                            .appendingTextField("password", value: "somePassword")
                            .appendingTextField("username", value: "someUsername")
                            .withContentType(.json)
                            .decodeJSONOnReceive(for: String.self)
        
        let jsonData = request.request.httpBody!
        let json = try? JSONSerialization.jsonObject(with: jsonData) as? [String: String]
        
        let targetJSONData = "{\"username\":\"someUsername\",\"password\":\"somePassword\"}".data(using: .utf8)!
        let targetJSON = try? JSONSerialization.jsonObject(with: targetJSONData) as? [String: String]
        XCTAssertEqual(json, targetJSON)
    }
    
    func testURLEncoding() {
        let request = URL(domain: "https://example.com", path: "path")!
                            .makeRequest(with: .post)
                            .appendingTextField("username", value: "someUsername")
                            .appendingTextField("password", value: "somePassword")
                            .withContentType(.formURLEncoded)
                            .decodeJSONOnReceive(for: String.self)
        
        let formURLData = request.request.httpBody?.utf8String
        
        let targetFormURLData = "username=someUsername&password=somePassword"
        
        XCTAssertEqual(formURLData, targetFormURLData)
    }
    
    
}
