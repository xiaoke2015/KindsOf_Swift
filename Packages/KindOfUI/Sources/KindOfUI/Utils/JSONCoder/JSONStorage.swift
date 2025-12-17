//
//  JSONStorage.swift
//
//  Created by 李加建 on 2021/11/1.
//

import Foundation

public enum JSONStorage {
    public static func object<Object: Decodable>(_ type: Object.Type, forKey key: String) -> Object? {
        guard let data = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
        return try? JSONDecoder().decode(type, from: data)
    }

    public static func set<Object: Encodable>(object: Object, forKey key: String) {
        let data = try? JSONEncoder().encode(object) as Data
        UserDefaults.standard.set(data, forKey: key)
    }

    public static func string(forKey key: String) -> String? {
        UserDefaults.standard.object(forKey: key) as? String
    }

    public static func setString(_ string: String?, forKey key: String) {
        UserDefaults.standard.set(string, forKey: key)
    }
}
