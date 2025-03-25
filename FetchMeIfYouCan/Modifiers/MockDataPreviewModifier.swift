//
//  MockDataPreviewModifier.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 25.03.2025.
//

import SwiftUI

struct MoickDataPreviewModifier: PreviewModifier {
    static func makeSharedContext() async throws -> CharacterViewModel {
        let mockViewModel = CharacterViewModel(service: MockCharacterService())
        await mockViewModel.loadCharacters(for: "Slytherin")
        return mockViewModel
    }
    
    func body(content: Content, context: CharacterViewModel) -> some View {
        content
            .environment(context)
    }
}
