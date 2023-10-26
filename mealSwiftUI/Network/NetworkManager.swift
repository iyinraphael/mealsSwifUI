//
//  NetworkManager.swift
//  mealSwiftUI
//
//  Created by Iyin Raphael on 10/26/23.
//

import Foundation

protocol NetworkManager {
    
    func urlSessionRequest(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void)
    
}


extension NetworkManager {
    
}
