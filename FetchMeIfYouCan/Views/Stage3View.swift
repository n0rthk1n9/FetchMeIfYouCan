//
//  Stage3View.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 25.03.2025.
//

import SwiftUI

struct Stage3View: View {
    @Environment(CharacterViewModel.self) private var viewModel

    @State private var house = ""

    var body: some View {
        VStack {
            if viewModel.isLoading && viewModel.characters.isEmpty {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if viewModel.characters.isEmpty {
                ContentUnavailableView("Search for a hogwarts house", systemImage: "wand.and.stars")
            } else {
                List(viewModel.characters) { character in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(character.name).bold()
                            if let house = character.house, house != "" {
                                Text("House: \(house)")
                            }

                        }
                        Spacer()
                        if let characterImageURLString = character.image,
                            let url = URL(string: characterImageURLString), url.scheme != nil,
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
                        } else if let image = character.image {
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 50)
                        }
                    }
                }
            }
        }
        .searchable(text: $house)
        .task(id: house) {
            try? await Task.sleep(nanoseconds: 500_000_000)
            await viewModel.loadCharacters(for: house)
        }
        .navigationTitle("Architecture Time")
    }
}

#Preview(traits: .mockData) {
    Stage3View()
}
