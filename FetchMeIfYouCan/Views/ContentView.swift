//
//  ContentView.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 24.03.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Because who needs a pilot’s license when you have URLSession")
                    .font(.title)
                    .multilineTextAlignment(.center)
                NavigationLink("Stage 1: Get All Characters", destination: Stage1View())
                NavigationLink("Stage 2: Search Characters by House", destination: Stage2View())
                NavigationLink("Stage 3: Clean Architecture", destination: EmptyView())
                Spacer()
            }
            .navigationTitle("Fetch Me If You Can")
        }
    }
}

#Preview {
    ContentView()
}
