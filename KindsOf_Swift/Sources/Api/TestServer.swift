//
//  TestServer.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/26.
//


class TestServer {
    
    init() {}
    static let shared: TestServer = .init()
    
    func ad() {
        let req = TestApi.shared.request("url", method: "GET")
        let req2 = TestApi.shared.request("url", method: "GET")
        
        TestAsyncTask.run {
            
            async let userInfo = req.responseDecodable(of: String.self)
            async let userConfig = req2.responseDecodable(of: String.self)
            
            return try await (userInfo, userConfig)
        } onSuccess: { result in
            print("\(result.0), \(result.1)")
        } onError: { error in
            print("\(error)")
        }
    }
    
    func getUserInfo(_ params: [String: Any]? = nil, interceptor: ApiRequestInterceptor? = nil) async throws -> UserModel {
        try await TestApi.shared.request("url", method: "GET", params: params, interceptor: interceptor).responseDecodable(of: UserModel.self)
    }
    
    func getUserConfig() async throws -> UserConfig {
        try await TestApi.shared.request("url", method: "GET").responseDecodable(of: UserConfig.self)
    }
    
    
    
    func getGroupUserInfo() async throws -> (UserModel, UserConfig) {
        async let userInfo = getUserInfo()
        async let userConfig = getUserConfig()
        
        // 所有请求并行执行，在这里等待所有结果
        return try await (userInfo, userConfig)
    }
}
