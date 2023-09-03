//
//  HTTPManager.swift
//  thirty-ios
//
//  Created by 이경규 on 2023/09/03.
//

import Foundation
import OSLog

enum HTTPError: Error {
    case URLError
    case RequestBody
}

final class HTTPManager {
    static func request(method: String, url: String, body: Any? = nil) async throws -> Data {
        guard let validURL = URL(string: url) else { throw HTTPError.URLError };
        
        var urlRequest = URLRequest(url: validURL)
        urlRequest.httpMethod = method
        
        if body != nil {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body)
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        return data
    }
    
    static func requestGET(url: String, body: Any? = nil) async throws -> Data {
        try await request(method: "GET", url: url, body: body)
    }
}
