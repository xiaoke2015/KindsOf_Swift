//
//  ApiParameters.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/25.
//

import Foundation

public typealias ApiParameters = [String: any Any & Sendable]

extension ApiParameters {
    func toJSONEncoding() -> Data? {
        try? JSONSerialization.data(withJSONObject: self)
    }
    
    func toURLEncoding() -> Data? {
        var components = URLComponents()
        components.queryItems = self.map { key, value in
            URLQueryItem(name: key, value: "\(value)")
        }
        
        return components.query?.data(using: .utf8)
    }
    
    func toQuery() -> String? {
        var components = URLComponents()
        components.queryItems = self.map { key, value in
            URLQueryItem(name: key, value: "\(value)")
        }
        
        return components.query
    }
}
