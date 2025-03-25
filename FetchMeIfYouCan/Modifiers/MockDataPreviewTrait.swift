//
//  MockDataPreviewTrait.swift
//  FetchMeIfYouCan
//
//  Created by Jan Armbrust on 25.03.2025.
//

import SwiftUI

extension PreviewTrait where T == Preview.ViewTraits {
    static let mockData: Self = .modifier(MoickDataPreviewModifier())
}
