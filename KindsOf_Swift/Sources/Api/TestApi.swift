//
//  TestApi.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/17.
//

import Foundation


class TestApi {
    static func test() async throws -> String {
        let url = "https://jsonplaceholder.typicode.com/posts"
        
        var req = URLRequest(url: URL(string: url)!)
        let (data, response) = try await URLSession(configuration: .default).data(for: req)
        let test = String(data: data, encoding: .utf8)
        let resp = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
        print("\(resp)")
        return ""
    }
}
