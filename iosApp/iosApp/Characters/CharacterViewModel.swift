//
//  CharacterViewModel.swift
//  iosApp
//
//  Created by Alexandra Kurganova on 29.05.2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import shared

@MainActor
final class CharacterViewModel: ObservableObject {
    @Published private(set) var characters: [Person] = []

    private let ktorClient = KtorClient()

    func fetchCharacters() async throws {
        let charactersResult = try await ktorClient.getAllCharacters()
        characters = charactersResult.compactMap({ $0 as? Person })
    }
}
