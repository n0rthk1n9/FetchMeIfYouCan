//
//  Stage1View.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 24.03.2025.
//

import SwiftUI

struct Stage1View: View {
    @State private var characters: [Character] = []

    var body: some View {
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
                   !characterImageURLString.isEmpty {
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
        .task {
            await fetchCharacters()
        }
        .navigationTitle("All Characters")
    }

    func fetchCharacters() async {
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters") else { return }

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
    Stage1View()
}
