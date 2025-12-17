//
//  JSON.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/12/2.
//

import Foundation

public extension Data {
    func jsonObject(options opt: JSONSerialization.ReadingOptions = []) throws -> Any {
        try JSONSerialization.jsonObject(with: self, options: opt)
    }
    
    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        try JSONDecoder().decode(type, from: self)
    }
    
    func encoding(_ encoding: String.Encoding = .utf8) -> String? {
        String(data: self, encoding: encoding)
    }
    
    func test() {
        let data = Data()
        do {
            let obj = try data.jsonObject() as? [String: Any]
            let mod = try data.decode(String.self)
            let s = data.encoding()
        } catch  {
            print("\(error)")
        }
    }
}
