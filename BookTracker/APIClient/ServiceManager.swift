//
//  ServiceManager.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 28.03.2023.
//

import Foundation

final class ServiceManager {
    public static let shared = ServiceManager()
    
    func callService<T: Decodable>(urlString: String, success: @escaping ((T) -> Void), fail: @escaping ((Error) -> Void)) {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest, completionHandler: {
            data, response, error in
            
            guard error == nil else { return }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let json = try decoder.decode(T.self, from: data)
                success(json)
            } catch let error {
                let error = NSError(domain: "ServiceManager", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to decode response: \(error.localizedDescription)"])
                fail(error)
            }
        })
        task.resume()
    }
}

