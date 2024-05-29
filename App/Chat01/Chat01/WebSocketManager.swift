//
//  WebSocketManager.swift
//  Chat01
//
//  Created by Massimo Olivieri on 29/05/24.
//

import Foundation
import Combine

class WebSocketManager: ObservableObject {
    @Published var messages: [String] = []
    private var webSocketTask: URLSessionWebSocketTask?
    
    func connect(to serverAddress: String) {
        guard let url = URL(string: "ws://\(serverAddress)") else { return }
        webSocketTask = URLSession.shared.webSocketTask(with: url)
        webSocketTask?.resume()
        receiveMessages()
    }
    
    private func receiveMessages() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .failure(let error):
                print("WebSocket error: \(error)")
            case .success(let message):
                switch message {
                case .string(let text):
                    self?.messages.append(text)
                default:
                    break
                }
                self?.receiveMessages()
            }
        }
    }
    
    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
    }
}
