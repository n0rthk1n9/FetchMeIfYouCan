//
//  CharacterService.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 25.03.2025.
//

import Foundation

struct CharacterService: CharacterServiceProtocol {
    func fetchCharacters(byHouse house: String) async throws -> [Character] {
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/\(house.lowercased())") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Character].self, from: data)
    }
}
