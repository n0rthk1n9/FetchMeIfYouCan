//
//  CharacterService.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 25.03.2025.
//

import Foundation

struct CharacterService: CharacterServiceProtocol {
    func fetchCharacters(byHouse house: String) async throws -> [Character] {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "hp-api.onrender.com"
        components.path = "/api/characters/house/\(house.lowercased())"
        
        guard let url = components.url else {
            throw HPAPIError.invalidURL
        }
        
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw HPAPIError.invalidResponseCode
        }
        
        do {
            return try JSONDecoder().decode([Character].self, from: data)
        } catch {
            throw HPAPIError.decodingError(error)
        }
    }
}
