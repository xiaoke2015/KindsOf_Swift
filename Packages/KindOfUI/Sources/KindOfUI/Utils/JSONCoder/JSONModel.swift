//
//  JSONModel.swift
//  JSONCore
//
//  Created by 李加建 on 2022/1/4.
//

import Foundation
public class JSONModel {
    init() {}
    
    /// Decodes a top-level value of the given type from the given JSON representation.
    /// - Parameters:
    ///   - type: The type of the value to decode.
    ///   - data: The data to decode from.
    /// - Returns: A value of the requested type
    public static func decode<Object: Decodable>(_ type: Object.Type, data: Data?) -> Object? {
        guard let data2 = data else { return nil }
        return try? JSONDecoder().decode(type, from: data2)
    }

    public static func decode<Object: Decodable>(_ type: Object.Type, data: Data?, forKey key: String) -> Object? {
        let objDict = JSONModel.jsonObject(with: data) as? [String: Any]
        let objForkey = objDict?[key]
        guard let data = JSONModel.data(withJSONObject: objForkey) else { return nil }
        return try? JSONDecoder().decode(type, from: data)
    }

    public static func encode<Object: Encodable>(object: Object) -> Data? {
        try? JSONEncoder().encode(object)
    }
}

public extension JSONModel {
    
    /// Create a Foundation object from JSON data
    /// - Parameter data: <#data description#>
    /// - Returns: <#description#>
    static func jsonObject(with data: Data?) -> Any? {
        guard let data2 = data else { return nil }
        return try? JSONSerialization.jsonObject(with: data2, options: .allowFragments)
    }

    /// Generate JSON data from a Foundation object
    /// - Parameter obj: <#obj description#>
    /// - Returns: <#description#>
    static func data(withJSONObject obj: Any?) -> Data? {
        guard let obj2 = obj else { return nil }
        if obj2 is NSNull {
            return nil
        }
        return try? JSONSerialization.data(withJSONObject: obj2, options: .fragmentsAllowed)
    }
}

public extension JSONModel {
    
    /// Decodes a top-level value of the given type from the given JSON representation.
    /// - Parameters:
    ///   - type: The type of the value to decode.
    ///   - data: The data to decode from.
    /// - Returns: A value of the requested type
    static func debugDecode<Object: Decodable>(_ type: Object.Type, data: Data?) -> Object? {
        guard let data2 = data else { return nil }
        var res: Object? = nil
        do {
            res = try JSONDecoder().decode(type, from: data2)
        } catch DecodingError.dataCorrupted(let context) {
            print(context)
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        return res
    }
}

