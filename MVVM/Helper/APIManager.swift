//
//  APIManager.swift
//  MVVM
//
//  Created by SHAYANUL HAQ SADI on 1/3/24.
//

import UIKit

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case invalidDecoding
    case network(Error?)
}

typealias handler = (Result<[Product], DataError>) ->  Void 

final class APIManager {
    
    static let shared = APIManager() // singleton Design pattern
    
    private init() {} // Singleton Design pattern
    
    func fetchProducts(completion: @escaping handler) {
        guard let url = URL(string: Constant.API.productURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        // Background Task 
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                    200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            // JSONDecoder() = converts data to Model (array)
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.network(error)))
            }
            
        }.resume()

    }
}


// final class = final class stops furthure inheritance

// singleton (small s) = singlton class can be created outside of class
// Singleton (cap S) = singlton class can not be created outside of class
