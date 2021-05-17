//
//  ComicCellViewModel.swift
//  Marvelder
//
//  Created by eldin smakic on 14/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import Combine

final class ComicCellViewModel: GenericCellViewModel {

    init() {
        super.init(repo: ComicCellRepositoryMarvel.shared)
    }
}

final class EventCellViewModel: GenericCellViewModel {

    init() {
        super.init(repo: EventsCellRepositoryMarvel.shared)
    }
}

final class SeriesCellViewModel: GenericCellViewModel {

    init() {
        super.init(repo: SeriesCellRepositoryMarvel.shared)
    }
}
