//
//  GlobalHeaderInterceptor.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/26.
//

import Foundation

class GlobalHeaderInterceptor: ApiRequestInterceptor {
    init() {
        //
    }
    
    func adapt(_ urlRequest: URLRequest) -> URLRequest {
        var req = urlRequest
        req.addValue("yoken", forHTTPHeaderField: "yoken")
//        req.addValue("", forHTTPHeaderField: "")
//        req.addValue("", forHTTPHeaderField: "")
//        req.addValue("", forHTTPHeaderField: "")
//        req.addValue("", forHTTPHeaderField: "")
        
        return req
    }
}
