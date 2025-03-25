//
//  Stage2View.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 24.03.2025.
//

import SwiftUI

struct Stage2View: View {
    @State private var house = ""
    @State private var characters: [Character] = []
    @State private var debounceTask: DispatchWorkItem?
    @State private var isLoading = false

    var body: some View {
        VStack {
            if isLoading && characters.isEmpty {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if characters.isEmpty {
                ContentUnavailableView("Search for a hogwarts house", systemImage: "wand.and.stars")
            } else {
                List(characters) { character in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(character.name).bold()
                            if let house = character.house, house != "" {
                                Text("House: \(house)")
                            }

                        }
                        Spacer()
                        if let characterImageURLString = character.image,
                            let url = URL(string: characterImageURLString),
                            !characterImageURLString.isEmpty
                        {
                            AsyncImage(
                                url: url,
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 50)
                                },
                                placeholder: {
                                    EmptyView()
                                }
                            )
                        }
                    }
                }
            }
        }
        .searchable(text: $house)
        .task(id: house) {
            try? await Task.sleep(nanoseconds: 500_000_000)
            await fetchCharacters()
        }
        .navigationTitle("Search by House")
    }

    func fetchCharacters() async {
        isLoading = true
        defer { isLoading = false }
        let trimmedHouse = house.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedHouse.isEmpty else {
            characters = []
            return
        }
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/\(house.lowercased())") else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([Character].self, from: data)
            characters = decoded
        } catch {
            print("Error: \(error)")
        }
    }
}

#Preview {
    Stage2View()
}
