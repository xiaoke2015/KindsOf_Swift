//
//  ApiResponse.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/25.
//

import Foundation

public struct ApiResponse: @unchecked Sendable {
    var request: URLRequest?
    var response: HTTPURLResponse?
    var data: Data?
    var error: Error?
}

public extension ApiResponse {
    
    func responseDecodable<T: Decodable>(of type: T.Type, block:((Result<T, Error>) -> Void)? = nil) {
        if let error = error {
            block?(.failure(error))
            return
        }
        
        // 检查 HTTP 响应状态
        guard let httpResponse = response,
              (200...299).contains(httpResponse.statusCode) else {
            block?(.failure(NSError(domain: "", code: 0)))
            return
        }
        
        guard let data = data else {
            block?(.failure(NSError(domain: "", code: 0)))
            return
        }
        
        do {
            let obj = try JSONDecoder().decode(type, from: data)
            block?(.success(obj))
        } catch {
            block?(.failure(error))
        }
    }
}
