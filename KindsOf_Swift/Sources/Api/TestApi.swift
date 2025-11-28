//
//  TestApi.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/17.
//

import Foundation


class TestApi {
    init() {}
    static let shared: TestApi = .init()
    
    static func test() async throws -> String {
        let url = "https://jsonplaceholder.typicode.com/posts"
        
        var req = URLRequest(url: URL(string: url)!)
        let (data, response) = try await URLSession(configuration: .default).data(for: req)
        let test = String(data: data, encoding: .utf8)
        let resp = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
        print("\(resp)")
        return ""
    }
    
    static func request(_ request: ApiRequest, block:((Result<String, Error>) -> Void)? = nil) {
        Task() {
            do {
                let urlRequest = try request.asURLRequest()
                let (data, response) = try await URLSession(configuration: .default).data(for: urlRequest)
                
                let apiResp = ApiResponse(request: urlRequest, response: response as? HTTPURLResponse, data: data)

                
                let resp = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print("\(resp)")
                
                let obj = try JSONDecoder().decode([String].self, from: data)
                
                await MainActor.run {
                    block?(.success(""))
                }
            } catch  {
                block?(.failure(error))
            }
        }
    }
    
    func request(_ request: ApiRequest, interceptor: ApiRequestInterceptor? = nil, block:((Result<Payload, Error>) -> Void)? = nil) {
        
        guard var urlRequest = try? request.asURLRequest() else {
            block?(.failure(NSError(domain: "", code: 1)))
            return
        }
        
        if let interceptor = interceptor {
            urlRequest = interceptor.adapt(urlRequest)
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let apiResp = ApiResponse(request: urlRequest, response: response as? HTTPURLResponse, data: data, error: error)
            DispatchQueue.main.async {
                apiResp.responseDecodable(of: Payload.self, block: block)
            }
        }.resume()
    }
    
    func request(_ url: URLConvertible, method: String, params: ApiParameters? = nil, interceptor: ApiRequestInterceptor? = nil) -> ApiDataRequest {
        ApiDataRequest(url: url, method: method, headers: [:], params: params, interceptor: interceptor)
    }
}

extension TestApi {
    func getList(_ req: String, params: ApiParameters? = nil, interceptor: ApiRequestInterceptor? = nil, block:((Result<[Post], Error>) -> Void)? = nil) {
        let url = "https://jsonplaceholder.typicode.com/posts"
        TestApi.shared.request(url, method: "GET", params: params, interceptor: interceptor)
            .responseDecodable(of: [Post].self, block: block)
    }
}
