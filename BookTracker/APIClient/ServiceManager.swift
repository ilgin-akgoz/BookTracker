//
//  ServiceManager.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 28.03.2023.
//

import Foundation

final class ServiceManager {
    public static let shared = ServiceManager()
    
    func callService<T: Decodable>(with url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw SMError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw SMError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw SMError.invalidData
        }
        
    }
}

