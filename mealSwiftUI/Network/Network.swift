//
//  Network.swift
//  mealSwiftUI
//
//  Created by Iyin Raphael on 10/26/23.
//

import Foundation


class Network {
    private let baseUrlString = "https://themealdb.com/api/json/v1/1"
    
    init() {}
    
    private func urlHelper(urlString: String, queryItem: URLQueryItem) -> URL {
        guard let baseUrl = URL(string: "\(baseUrlString)/\(urlString)"),
              var urlCompoment = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)
        else { fatalError("Unable to retrieve base url") }
        
        urlCompoment.queryItems = [queryItem]
        
        guard let url = urlCompoment.url else { fatalError("Unable to retrieve base url") }
        
        return url
    }
    
    // Make network call for meals in categories
    func getAllMealsIn(category: String, completion: @escaping (Result<MealCategory, NetworkError>) -> Void) {
        let queryItem = URLQueryItem(name: "c", value: category)
        let url = urlHelper(urlString: "filter.php", queryItem: queryItem)
        
        urlSessionRequest(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    guard let mealCategory = try? jsonDecoder.decode(MealCategory.self, from: data) else { return }
                    completion(.success(mealCategory))
                }
            case .failure(_):
                completion(.failure(.noDataFailure))
            }
        }
        
    }
    
    
    // Make network call for meal details
    func getMealDetails(mealId: String, completion: @escaping (Result<Meal, NetworkError>) -> Void) {
        let queryItem = URLQueryItem(name: "i", value: mealId)
        let url = urlHelper(urlString: "lookup.php", queryItem: queryItem)
        
        urlSessionRequest(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    guard let meal = try? jsonDecoder.decode(Meal.self, from: data) else { return }
                   completion(.success(meal))
                }
            case .failure(_):
                completion(.failure(.decodeFailure))
            }
        }
    }
    
}


extension Network: NetworkManager {
    func urlSessionRequest(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.generalFailure))
                fatalError("Error: \(error)")
            }
            
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode != 200 {
                completion(.failure(.networkFailure))
                fatalError("Error: with statuse code \(httpResponse.statusCode)")
            }
            
            guard let data = data else {
                completion(.failure(.noDataFailure))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}
