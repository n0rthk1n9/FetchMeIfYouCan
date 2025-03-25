//
//  MockCharacterService.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 25.03.2025.
//

import Foundation

struct MockCharacterService: CharacterServiceProtocol {
    func fetchCharacters(byHouse house: String) async throws -> [Character] {
        return [
            Character(name: "Harry Potter", house: "Gryffindor", image: "harry"),
            Character(name: "Hermione Granger", house: "Gryffindor", image: "hermione")
        ]
    }
}
