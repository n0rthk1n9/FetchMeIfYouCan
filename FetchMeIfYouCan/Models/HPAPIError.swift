//
//  HPAPIError.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 25.03.2025.
//

import Foundation

enum HPAPIError: Error {
    case invalidURL
    case invalidResponseCode
    case decodingError(Error)
}
