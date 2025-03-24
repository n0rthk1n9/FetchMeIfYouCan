//
//  Character.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 24.03.2025.
//

import Foundation

struct Character: Codable, Identifiable {
    let id = UUID()
    let name: String
    let house: String?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case name, house, image
    }
}
