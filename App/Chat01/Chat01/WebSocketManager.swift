import Foundation
import Combine

class WebSocketManager: ObservableObject {
    @Published var messages: [String] = []
    private var webSocketTask: URLSessionWebSocketTask?
    private var currentMessage: String = ""
    private var isReceivingMessage: Bool = false
    
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
                    self?.handleMessage(text)
                default:
                    break
                }
                self?.receiveMessages()
            }
        }
    }
    
    private func handleMessage(_ text: String) {
        guard let data = text.data(using: .utf8),
              let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
              let role = json["role"] as? String, role == "assistant",
              let type = json["type"] as? String, type == "message" else {
            return
        }
        
        if let start = json["start"] as? Bool, start {
            isReceivingMessage = true
            currentMessage = ""
            messages.append(currentMessage)
        } else if let end = json["end"] as? Bool, end {
            isReceivingMessage = false
            if !currentMessage.isEmpty {
                messages[messages.count - 1] = currentMessage
            }
        } else if let content = json["content"] as? String, isReceivingMessage {
            currentMessage += content
            if !messages.isEmpty {
                messages[messages.count - 1] = currentMessage
            }
        }
    }
    
    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
    }
}
