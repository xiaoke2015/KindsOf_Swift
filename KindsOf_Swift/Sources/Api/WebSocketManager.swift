//
//  WebSocketManager.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/24.
//

import UIKit

class WebSocketManager: NSObject {
    private var webSocketTask: URLSessionWebSocketTask?
    lazy var urlSession = URLSession(configuration: .default)
    private let serverUrl = URL(string: "ws://localhost:8765")!
    
    
    
    // 1. 连接服务器
    func connect() {
        // 关闭已有连接
        disconnect()
        
        webSocketTask = urlSession.webSocketTask(with: serverUrl)
        webSocketTask?.resume()
        
        // 开始监听消息
        receiveMessage()
        
        // 发送心跳（示例）
        sendPing()
    }
    
    private func receiveMessage() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .failure(let error):
                print("Failed to receive message: \(error)")
                // 处理错误，例如尝试重连
            case .success(let message):
                switch message {
                case .string(let text):
                    print("Received text message: \(text)")
                    self?.handleMessage(text) // 处理消息
                case .data(let data):
                    print("Received binary data: \(data)")
                    self?.handleData(data) // 处理二进制数据（如游戏状态）
                @unknown default:
                    fatalError()
                }
                
                // 继续监听下一条消息
                self?.receiveMessage()
            }
        }
    }
    
    
    // 3. 发送消息（文本）
    func sendMessage(_ message: String) {
        let message = URLSessionWebSocketTask.Message.string(message)
        webSocketTask?.send(message) { error in
            if let error = error {
                print("Failed to send message: \(error)")
            }
        }
    }
    
    // 3. 发送消息（二进制数据，适合传输游戏状态）
    func sendData(_ data: Data) {
        let message = URLSessionWebSocketTask.Message.data(data)
        webSocketTask?.send(message) { error in
            if let error = error {
                print("Failed to send data: \(error)")
            }
        }
    }
    
    // 4. 发送 Ping（保持连接活跃）
    private func sendPing() {
        webSocketTask?.sendPing { [weak self] error in
            if let error = error {
                print("Failed to send Ping: \(error)")
            } else {
                // Ping 成功，间隔一段时间后再发送下一次
                DispatchQueue.global().asyncAfter(deadline: .now() + 30) {
                    self?.sendPing()
                }
            }
        }
    }
    
    // 5. 断开连接
    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        webSocketTask = nil
    }
    
    // --- 处理业务逻辑 ---
    private func handleMessage(_ text: String) {
        // 将 JSON 字符串解析为模型
        guard let data = text.data(using: .utf8),
              let messageDict = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return
        }
        
        // 根据消息类型进行分发
        if let type = messageDict["type"] as? String {
            switch type {
            case "game_state_update":
                // 处理游戏状态更新
                break
            case "chat_message":
                // 处理聊天消息
                break
            default:
                break
            }
        }
    }
    
    private func handleData(_ data: Data) {
        // 处理二进制数据，例如使用 Protocol Buffers 或 FlatBuffers 解码
        // let gameState = try? GameState(serializedData: data)
    }
}
