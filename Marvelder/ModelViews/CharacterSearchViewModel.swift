//
//  CharacterSearchViewModel.swift
//  Marvelder
//
//  Created by eldin smakic on 15/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import Foundation
import Combine

final class CharacterSearchViewModel: ObservableObject {

    let repo = CharacterRepositoryMarvel.shared

    @Published var characters = [Fake.Character.character]
    @Published var isLoad = false

    var cancellationToken: AnyCancellable?

    public func search(name: String) {
        cancellationToken = repo.getSearch(WithText: name)
            .sink { error in
                print(error)
        } receiveValue: { data in
            self.characters = data
            self.isLoad = true
        }
    }
}
