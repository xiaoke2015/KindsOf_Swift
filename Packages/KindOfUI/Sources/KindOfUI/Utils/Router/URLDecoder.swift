//
//  URLMatcher.swift
//  RouterDemo
//
//  Created by 李加建 on 2021/6/4.
//

import Foundation

class URLDecoder {
    lazy var url: String = ""
    lazy var scheme: String = ""
    lazy var host: String = ""
    lazy var params: [String: Any] = [:]
    init(urlString: String) {
        let urls = urlString.components(separatedBy: "?")
        if urls.count >= 1, let first = urls.first {
            url = first
            let keyparams = first.components(separatedBy: "://") as [String]
            if let scheme = keyparams.first {
                self.scheme = scheme
            }

            if keyparams.count > 1 {
                host = keyparams[1]
            }
        }

        if urls.count == 2, let last = urls.last {
            let keyparams = last.components(separatedBy: "&")
            keyparams.forEach { param in
                let keyValue = param.components(separatedBy: "=")
                if let key = keyValue.first, let value = keyValue.last, keyValue.count > 1 {
                    params[key] = value
                }
            }
        }
    }

    func append(data: Data?) {
        guard let data = data else { return }
        guard let params = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return }
        params.forEach { key, value in
            self.params[key] = value
        }
    }
    
    var string: String?
//    var url: URL?
//    var scheme: String?
//    var host: String?
    var query: String?
    
    var urlComponents: URLComponents?
    
    init(string: String?) {
        guard let string = string else { return }
        urlComponents = URLComponents(string: string)
    }
}
