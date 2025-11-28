//
//  NetworkError.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/26.
//


import Foundation

enum NetworkError: Error, LocalizedError {
    // 客户端错误
    case invalidURL
    case invalidRequest
    case requestTimeout
    case requestCancelled
    
    // 服务器错误
    case badRequest(String?)          // 400
    case unauthorized(String?)        // 401
    case forbidden(String?)           // 403
    case notFound(String?)           // 404
    case methodNotAllowed(String?)   // 405
    case conflict(String?)           // 409
    case tooManyRequests(String?)    // 429
    case internalServerError(String?) // 500
    case serviceUnavailable(String?) // 503
    case gatewayTimeout(String?)     // 504
    
    // 网络连接错误
    case noInternetConnection
    case networkConnectionLost
    case dnsLookupFailed
    case cannotConnectToHost
    case secureConnectionFailed
    
    // 数据错误
    case invalidResponse
    case invalidData
    case decodingFailed(Error)
    case encodingFailed(Error)
    
    // 业务逻辑错误
    case businessLogicError(code: Int, message: String)
    case maintenance(String) // 系统维护
    
    // 自定义错误
    case custom(String)
    case unknown(Error?)
    
    // 错误描述
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "无效的URL地址"
        case .invalidRequest:
            return "请求参数错误"
        case .requestTimeout:
            return "请求超时"
        case .requestCancelled:
            return "请求已取消"
            
        case .badRequest(let message):
            return message ?? "请求参数错误"
        case .unauthorized(let message):
            return message ?? "未授权访问"
        case .forbidden(let message):
            return message ?? "访问被禁止"
        case .notFound(let message):
            return message ?? "资源未找到"
        case .methodNotAllowed(let message):
            return message ?? "请求方法不允许"
        case .conflict(let message):
            return message ?? "请求冲突"
        case .tooManyRequests(let message):
            return message ?? "请求过于频繁，请稍后重试"
        case .internalServerError(let message):
            return message ?? "服务器内部错误"
        case .serviceUnavailable(let message):
            return message ?? "服务暂时不可用"
        case .gatewayTimeout(let message):
            return message ?? "网关超时"
            
        case .noInternetConnection:
            return "网络连接不可用，请检查网络设置"
        case .networkConnectionLost:
            return "网络连接已断开"
        case .dnsLookupFailed:
            return "域名解析失败"
        case .cannotConnectToHost:
            return "无法连接到服务器"
        case .secureConnectionFailed:
            return "安全连接失败"
            
        case .invalidResponse:
            return "服务器响应格式错误"
        case .invalidData:
            return "接收到的数据格式错误"
        case .decodingFailed(let error):
            return "数据解析失败: \(error.localizedDescription)"
        case .encodingFailed(let error):
            return "数据编码失败: \(error.localizedDescription)"
            
        case .businessLogicError(_, let message):
            return message
        case .maintenance(let message):
            return message
            
        case .custom(let message):
            return message
        case .unknown(let error):
            return error?.localizedDescription ?? "未知错误"
        }
    }
    
    // 错误代码（用于业务逻辑处理）
    var code: Int {
        switch self {
        case .invalidURL: return 1001
        case .invalidRequest: return 1002
        case .requestTimeout: return 1003
        case .requestCancelled: return 1004
            
        case .badRequest: return 400
        case .unauthorized: return 401
        case .forbidden: return 403
        case .notFound: return 404
        case .methodNotAllowed: return 405
        case .conflict: return 409
        case .tooManyRequests: return 429
        case .internalServerError: return 500
        case .serviceUnavailable: return 503
        case .gatewayTimeout: return 504
            
        case .noInternetConnection: return 2001
        case .networkConnectionLost: return 2002
        case .dnsLookupFailed: return 2003
        case .cannotConnectToHost: return 2004
        case .secureConnectionFailed: return 2005
            
        case .invalidResponse: return 3001
        case .invalidData: return 3002
        case .decodingFailed: return 3003
        case .encodingFailed: return 3004
            
        case .businessLogicError(let code, _): return code
        case .maintenance: return 5030
            
        case .custom: return 9998
        case .unknown: return 9999
        }
    }
}
