//
//  NetworkError.swift
//  mealSwiftUI
//
//  Created by Iyin Raphael on 10/26/23.
//

import Foundation

enum NetworkError: Error {
    // MARK: - Error types
    case decodeFailure
    case networkFailure
    case generalFailure
    case noDataFailure
}
