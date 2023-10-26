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
    
    // Make network call for meals in categories
    func getAllMealsIn(category: String, completion: @escaping (Result<MealCategory, NetworkError>) -> Void) {
        guard let baseUrl = URL(string: "\(baseUrlString)/filter.php") else { return }
        
        let urlQueryItem = URLQueryItem(name: "c", value: category)
        var urlCompoment = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)
        urlCompoment?.queryItems = [urlQueryItem]
        var urlRequest = URLRequest(url: urlCompoment?.url),
    }
    
    
    // Make network call for meal details
    func getMealDetails(mealId: String, completion: @escaping (Result<Meal, NetworkError>) -> Void) {
    }
    
}
