//
//  ApiRequestInterceptor.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/25.
//

import Foundation

public protocol ApiRequestInterceptor {
    func adapt(_ urlRequest: URLRequest) -> URLRequest
}
