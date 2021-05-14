//
//  ComicCellViewModel.swift
//  Marvelder
//
//  Created by eldin smakic on 14/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import Combine

final class ComicCellViewModel: ObservableObject {

    let repo = ComicCellRepositoryMarvel.shared

    @Published var comicCell = Fake.Comic.marvelComicCell
    @Published var isLoad = false

    var cancellationToken: AnyCancellable?

    public func getData(fromId id: String) {
        cancellationToken = repo.get(withId: id)
            .sink { error in
                print(error)
        } receiveValue: { data in
            self.comicCell = data
            self.isLoad = true
        }
    }
}

