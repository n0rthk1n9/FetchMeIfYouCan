//
//  FetchMeIfYouCanApp.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 24.03.2025.
//

import SwiftUI

@main
struct FetchMeIfYouCanApp: App {
    @State private var viewModel = CharacterViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
