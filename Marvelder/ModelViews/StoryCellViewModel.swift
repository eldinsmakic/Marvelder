//
//  StoryCellViewModel.swift
//  Marvelder
//
//  Created by eldin smakic on 16/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//


final class StoryCellViewModel: GenericCellViewModel {

    init() {
        super.init(repo: StoryCellRepositoryMarvel.shared)
    }
}
