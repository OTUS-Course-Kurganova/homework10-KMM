//
//  CharactersView.swift
//  iosApp
//
//  Created by Alexandra Kurganova on 29.05.2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject private var viewModel = CharacterViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters, id: \.self) { character in
                    NavigationLink(destination: CharactersDetailView(data: character)) {
                        Text(character.name)
                    }
                }
            }
        }
        .onAppear {
            Task {
                try await viewModel.fetchCharacters()
            }
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
