//
//  ChatView.swift
//  Chat01
//
//  Created by Massimo Olivieri on 29/05/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var webSocketManager = WebSocketManager()
    @State private var message: String = ""
    @AppStorage("serverAddress") private var serverAddress: String = "127.0.0.1:1001"
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(webSocketManager.messages, id: \.self) { message in
                    Text(message)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.vertical, 2)
                }
            }
            HStack {
                TextField("Message", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    sendMessage(message, to: serverAddress) { result in
                        switch result {
                        case .success:
                            webSocketManager.messages.append("You: \(message)")
                            message = ""
                        case .failure(let error):
                            print("Error sending message: \(error)")
                        }
                    }
                }) {
                    Image(systemName: "paperplane.fill")
                }
                .disabled(message.isEmpty)
            }
            .padding()
        }
        .onAppear {
            webSocketManager.connect(to: serverAddress)
        }
        .onDisappear {
            webSocketManager.disconnect()
        }
    }
}
