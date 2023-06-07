//
//  OpenAI_iOS_StarterApp.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/2/23.
//

import SwiftUI

@main
struct OpenAI_iOS_StarterApp: App {
    @State private var excursions = Excursion.sampleData
    
    var body: some Scene {
        WindowGroup {
            HomeView(excursions: $excursions)
        }
    }
}
