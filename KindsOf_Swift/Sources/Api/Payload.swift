//
//  Payload.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/25.
//

struct Payload: Codable {
    
}

public struct Post: Codable, Sendable {
    public var userId: Int?
    public var id: Int?
    public var title: String?
    public var body: String?
}
