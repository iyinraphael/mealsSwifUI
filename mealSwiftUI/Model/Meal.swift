//
//  Meal.swift
//  mealSwiftUI
//
//  Created by Iyin Raphael on 10/26/23.
//

import Foundation

struct Meal: Decodable, Hashable {
    // MARK: - Properties
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}

struct MealCategory: Decodable {
    // MARK: - Properties
    let meals: [Meal]
}
