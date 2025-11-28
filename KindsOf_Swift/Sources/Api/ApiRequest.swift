//
//  ApiRequest.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/25.
//

import Foundation

public protocol ApiRequest {
    var url: URLConvertible { get set }
    var method: String { get set }
    var headers: [String: String] { get set }
    func asURLRequest() throws -> URLRequest
}

public extension ApiRequest {
    func asURLRequest() throws -> URLRequest {
        let url = try url.asURL()
        var request = URLRequest(url: url)
        request.httpMethod = method
//        request.allHTTPHeaderFields
        if var url2 = request.url?.absoluteString {
            url2.append("?\("")")
            request.url = URL(string: url2)
        }
        
        return request
    }
}


public protocol ApiRequest2: Codable {
    
}

public struct LoginRequest: ApiRequest2 {
    public var mobile: String?
    public var code: String?
}

public extension ApiRequest2 {
    func toDict() -> [String: Any] {
        let mirror = Mirror(reflecting: self)
        
        var dictionary: [String: Any] = [:]
            
            for child in mirror.children {
                if let key = child.label {
                    dictionary[key] = child.value
                }
            }
        
        return dictionary.compactMapValues { $0 }
    }
    
    func toDict2() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            return dictionary ?? [:]
        } catch {
            print("转换失败: \(error)")
            return [:]
        }
    }
}
