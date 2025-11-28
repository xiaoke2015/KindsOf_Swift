//
//  ApiDataRequest.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/25.
//

import Foundation

struct ApiDataRequest: ApiRequest, @unchecked Sendable {
    var url: any URLConvertible
    
    var method: String
    
    var headers: [String : String]
    
    var params: ApiParameters? = nil
    
    var interceptor: ApiRequestInterceptor?
    
    func asURLRequest() throws -> URLRequest {
        let url = try url.asURL()
        var request = URLRequest(url: url)
        request.httpMethod = method

        if var url2 = request.url?.absoluteString, let query = params?.toQuery(), query.isEmpty == false {
            url2.append("?\(query)")
            request.url = URL(string: url2)
        }
        
        if method == "POST" {
            request.httpBody = params?.toJSONEncoding()
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } else {
            request.httpBody = params?.toURLEncoding()
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
        
        return request
    }
}

extension ApiDataRequest {
    func responseDecodable<T>(of type: T.Type, block: ((Result<T, Error>) -> Void)? = nil) where T: Decodable, T: Sendable {
        
        guard var urlRequest = try? asURLRequest() else {
            block?(.failure(NSError(domain: "", code: 1)))
            return
        }
        
        if let interceptor = interceptor {
            urlRequest = interceptor.adapt(urlRequest)
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let apiResp = ApiResponse(request: urlRequest, response: response as? HTTPURLResponse, data: data, error: error)
            DispatchQueue.main.async {
                apiResp.responseDecodable(of: type, block: block)
            }
        }.resume()
    }
    
    func responseDecodable<T>(of type: T.Type) async throws -> T where T: Decodable {
        
        var urlRequest = try asURLRequest()
        
        if let interceptor = interceptor {
            urlRequest = interceptor.adapt(urlRequest)
        }
 
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        // 验证 HTTP 响应状态码
        try validateHTTPResponse(response)
        
        // 使用更健壮的 JSON 解码
        return try decodeResponse(data: data, to: type)
    }
    
    func response() async throws -> Data {
        
        var urlRequest = try asURLRequest()
        
        if let interceptor = interceptor {
            urlRequest = interceptor.adapt(urlRequest)
        }
 
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        // 验证 HTTP 响应状态码
        try validateHTTPResponse(response)
        
        // 使用更健壮的 JSON 解码
        return data
    }
    
    
    // 提取验证逻辑
    private func validateHTTPResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NSError(domain: "", code: 0)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NSError(domain: "", code: 0)
        }
    }
    
    // 提取解码逻辑
    private func decodeResponse<T: Decodable>(data: Data, to type: T.Type) throws -> T {
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch let decodingError as DecodingError {
            throw decodingError
        } catch {
            throw NSError(domain: "", code: 0)
        }
    }
}
