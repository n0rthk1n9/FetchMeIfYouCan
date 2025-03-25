//
//  CharacterViewModel.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 25.03.2025.
//

import SwiftUI

@Observable
final class CharacterViewModel {
    var characters: [Character] = []
    private let service: CharacterServiceProtocol
    var isLoading = false

    init(service: CharacterServiceProtocol = CharacterService()) {
        self.service = service
    }

    @MainActor
    func loadCharacters(for house: String) async throws {
        isLoading = true
        defer { isLoading = false }
        do {
            let result = try await service.fetchCharacters(byHouse: house)
            characters = result
        } catch {
            throw error
        }
        isLoading = false
    }
}
