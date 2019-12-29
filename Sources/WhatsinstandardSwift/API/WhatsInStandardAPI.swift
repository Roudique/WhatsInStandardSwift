//
//  WhatsInStandardAPI.swift
//  WhatsinstandardSwift
//
//  Created by Roudique on 28.12.2019.
//

import Foundation

public class WhatsInStandardAPI {
    public enum APIError: Error {
        case networkError(Error)
        case requestError(Int, Data?)
        case invalidResponse(String)
        case decodingError
        case unknown
    }
    
    private enum Const {
        static let base = "whatsinstandard.com"
        static let endpoint = "/api/v6/standard.json"
    }
    
    // MARK: - Public
    public static func fetch(completion: @escaping (Result<StandardInfo, APIError>) -> Void) {
        guard let url = makeURL() else {
            completion(.failure(.unknown))
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse(String(describing: response))))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.requestError(httpResponse.statusCode, data)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.decodingError))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(EstimatedDate.dateFormatter)
            
            do {
                let info = try decoder.decode(StandardInfo.self, from: data)
                completion(.success(info))
            } catch {
                print("error: \(error)")
                completion(.failure(.decodingError))
            }
        }
        dataTask.resume()
    }
    
    // MARK: - Private
    private static func makeURL() -> URL? {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = Const.base
        components.path = Const.endpoint
        
        return components.url
    }
}
