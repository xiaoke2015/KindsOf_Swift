//
//  TestApiRequest.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/25.
//

import Foundation

public struct TestApiRequest: ApiRequest {

    public var url: any URLConvertible
    
    public var method: String
    
    public var headers: [String : String]
}
