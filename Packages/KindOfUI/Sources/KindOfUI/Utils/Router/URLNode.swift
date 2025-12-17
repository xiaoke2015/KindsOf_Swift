//
//  URLNode.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/12/4.
//

import Foundation

public class URLNode {
    private var urlComponents: URLComponents?
    public var data: Data?
    public var object: [String: Any]?
    public var dismiss: (() -> Void)? = nil
    
    public init(string: String?) {
        guard let string = string else { return }
        urlComponents = URLComponents(string: string)
    }
    
    var string: String? {
        urlComponents?.string
    }
    
    var url: URL? {
        urlComponents?.url
    }
    
    var scheme: String? {
        urlComponents?.scheme
    }
    
    var host: String? {
        urlComponents?.host
    }
    
    var query: String? {
        urlComponents?.query
    }
    
    func object(for key: String) -> Any? {
        urlComponents?.queryItems?.first { item in
            item.name == key
        }
    }
}
