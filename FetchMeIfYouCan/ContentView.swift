//
//  ContentView.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 24.03.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section("Because who needs a pilot’s license when you have URLSession") {
                    NavigationLink("Stage 1: Get All Characters", destination: EmptyView())
                    NavigationLink("Stage 2: Search Characters by House", destination: EmptyView())
                    NavigationLink("Stage 3: Clean Architecture", destination: EmptyView())
                }
            }
            .navigationTitle("Fetch Me If You Can")
        }
    }
}

#Preview {
    ContentView()
}
