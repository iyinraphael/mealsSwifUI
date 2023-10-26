//
//  MainViewViewModel.swift
//  mealSwiftUI
//
//  Created by Raphael Iyin on 10/26/23.
//

import Foundation

class MainViewViewModel {
    let network: Network
    
    init(network: Network) {
        self.network = network
        
        fetchCategories()
    }
    
    
    private func fetchCategories(meals:String = "Starter") {
        network.getAllMealsIn(category: meals) { result in
            switch result {
            case .success(let category):
                print(category)
            case .failure(_):
                print("failure")
            }
        }
    }
}
