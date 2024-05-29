import SwiftUI

struct ChatView: View {
    @StateObject private var webSocketManager = WebSocketManager()
    @State private var message: String = ""
    @AppStorage("serverAddress") private var serverAddress: String = "127.0.0.1:1001"
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(webSocketManager.messages.indices, id: \.self) { index in
                        let message = webSocketManager.messages[index]
                        if message.starts(with: "You: ") {
                            HStack {
                                Spacer()
                                Text(message.replacingOccurrences(of: "You: ", with: ""))
                                    .padding()
                                    .background(Color.blue.opacity(0.2))
                                    .cornerRadius(8)
                                    .padding(.vertical, 2)
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(15)
                                    .padding(.trailing, 10)
                            }
                        } else {
                            HStack {
                                Text(message)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                    .padding(.vertical, 2)
                                    .foregroundColor(.black)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(15)
                                    .padding(.leading, 10)
                                Spacer()
                            }
                        }
                    }
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
