//
//  URLConvertible.swift
//  AirServer
//
//  Created by i-sens on 2025/11/24.
//

import Foundation

public protocol URLConvertible: Sendable {
    func asURL() throws -> URL
}

extension String: URLConvertible {
    public func asURL() throws -> URL {
        guard let url = URL(string: self) else { throw NetworkError.invalidURL }

        return url
    }
}

extension URL: URLConvertible {
    public func asURL() throws -> URL {
        self
    }
}
