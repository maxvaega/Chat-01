import Foundation

func sendMessage(_ message: String, to serverAddress: String, completion: @escaping (Result<Void, Error>) -> Void) {
    guard let url = URL(string: "http://\(serverAddress)/") else {
        completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let json: [String: Any] = ["text": message]
    let jsonData = try? JSONSerialization.data(withJSONObject: json)
    request.httpBody = jsonData
    
    URLSession.shared.dataTask(with: request) { _, response, error in
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success(()))
        }
    }.resume()
}
