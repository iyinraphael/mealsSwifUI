//
//  mealSwiftUIApp.swift
//  mealSwiftUI
//
//  Created by Iyin Raphael on 10/26/23.
//

import SwiftUI

@main
struct mealSwiftUIApp: App {
    init () {
        let network = Network()
        let mainViewModel = MainViewViewModel(network: network)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
