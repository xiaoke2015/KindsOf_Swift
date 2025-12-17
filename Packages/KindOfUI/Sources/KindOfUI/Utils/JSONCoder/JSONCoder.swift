//
//  JSONCoder.swift
//
//  Created by 李加建 on 2021/6/7.
//

import Foundation

public enum JSONCoder {
    public static func encode<Object: Encodable>(object: Object) throws -> Data {
        let bytes = try JSONEncoder().encode(object)
        return Data(bytes)
    }

    public static func decode<Object: Decodable>(_ type: Object.Type, data: Data) throws -> Object? {
        try JSONDecoder().decode(type, from: data)
    }

    public static func jsonObject(with data: Data) throws -> Any {
        try JSONSerialization.jsonObject(with: data, options: .allowFragments)
    }

    public static func data(withJSONObject obj: Any?) -> Data? {
        guard let obj2 = obj else { return nil }
        return try? JSONSerialization.data(withJSONObject: obj2, options: .prettyPrinted)
    }

    public static func decode<Object: Decodable>(_ type: Object.Type, data: Data, forKey key: String) -> Object? {
        guard let jsonData = JSONCoder.jsonObject(with: data, forKey: key) else { return nil }
        return try? JSONDecoder().decode(type, from: jsonData)
    }

    /// JSON 数据转模型
    ///
    /// - parameter type: 要解码对象的类型
    /// - parameter object: 要从中解码的数据或对象
    /// - returns: A optional value of the requested type.
    ///
    public static func decode<Object: Decodable>(_ type: Object.Type, object: Any) throws -> Object? {
        if let data = object as? Data {
            return try? JSONDecoder().decode(type, from: data)
        }
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: .fragmentsAllowed) else {
            return nil
        }
        return try? JSONDecoder().decode(type, from: data)
    }

    /// 解析 JSON 数据字符串或Data
    /// - Parameters:
    ///   - obj:    需要解析的数据 Data 或 String
    ///
    /// - Returns:  返回 JSON 对象
    ///
    public static func jsonObject(from obj: Any?) -> Any? {
        if let data = obj as? Data {
            return try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        } else if let string = obj as? String {
            let data = string.data(using: .utf8)
            return jsonObject(from: data)
        } else {
            return nil
        }
    }
}

public extension JSONCoder {
    static func encodeToJSON<Object: Encodable>(object: Object) -> Any? {
        guard let data = try? JSONEncoder().encode(object) else { return nil }
        let obj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        print("\(obj as Any)")
        return obj
    }
}

public extension JSONCoder {
    static func jsonObject(with data: Data, forKey key: String) -> Data? {
        let jsonDict = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        let obj = jsonDict?[key] as Any
        let jsonData = try? JSONSerialization.data(withJSONObject: obj, options: .fragmentsAllowed)
        return jsonData
    }

    static func debugDecode<Object: Decodable>(_ type: Object.Type, data: Data) -> Object? {
        var res: Object? = nil
        do {
            res = try JSONDecoder().decode(type, from: data)
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

    static func encodeJSONString(info: Any?) -> String? {
        guard let info2 = info else { return nil }
        if let data = try? JSONSerialization.data(withJSONObject: info2, options: .fragmentsAllowed) {
            let string = String(data: data, encoding: .utf8)
            return string
        }
        return nil
    }
}
