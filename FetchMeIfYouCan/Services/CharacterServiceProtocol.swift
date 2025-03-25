//
//  CharacterServiceProtocol.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 25.03.2025.
//

import Foundation

protocol CharacterServiceProtocol {
    func fetchCharacters(byHouse house: String) async throws -> [Character]
}
