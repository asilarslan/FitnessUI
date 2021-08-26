//
//  FitnessApp.swift
//  Fitness
//
//  Created by Asil Arslan on 22.08.2021.
//

import SwiftUI

@main
struct FitnessApp: App {
    @ObservedObject var mainViewModel = MainViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(mainViewModel)
        }
    }
}
