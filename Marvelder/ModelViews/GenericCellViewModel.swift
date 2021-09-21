//
//  GenericCellViewModel.swift
//  Marvelder
//
//  Created by eldin smakic on 17/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import Combine

protocol GenericCellViewModelProtocol: ObservableObject {
    associatedtype MarvelComicCellType where MarvelComicCellType: MarvelListT

    var repo: RemoteRepositoryMarvel<MarvelComicCell> { get }

    var cancellationToken: AnyCancellable? { get set }

    func getData(fromId id: String)
}


class GenericCellViewModel: GenericCellViewModelProtocol {

    var repo: RemoteRepositoryMarvel<MarvelComicCell>

    var cancellationToken: AnyCancellable?

    typealias MarvelComicCellType = MarvelComicCell

    @Published var itemCell: MarvelComicCell?

    init( repo: RemoteRepositoryMarvel<MarvelComicCell>) {
        self.repo = repo
    }

    public func getData(fromId id: String) {
        cancellationToken = repo.get(withId: id)
            .sink { error in
                print(error)
            } receiveValue: { data in
                self.itemCell = data
            }
    }
}
