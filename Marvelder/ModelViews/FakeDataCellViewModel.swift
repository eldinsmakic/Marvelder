//
//  FakeDataCellViewModel.swift
//  Marvelder
//
//  Created by eldin smakic on 17/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

final class FakeDataCellViewModel: GenericCellViewModel {

    init() {
        super.init(repo: FakeDataRepositoryMarvel.shared)
    }
}
