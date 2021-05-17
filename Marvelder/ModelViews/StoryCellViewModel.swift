//
//  StoryCellViewModel.swift
//  Marvelder
//
//  Created by eldin smakic on 16/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import Combine

final class StoryCellViewModel: ObservableObject {

    let repo = StoryCellRepositoryMarvel.shared

    @Published var storyCell = Fake.Story.storyCell
    @Published var isLoad = false

    var cancellationToken: AnyCancellable?

    public func getData(fromId id: String) {
        cancellationToken = repo.get(withId: id)
            .sink { error in
                print("HHH \(error)")
        } receiveValue: { data in
            print("HHH working \(data)")
            self.storyCell = data
            self.isLoad = true
        }
    }
}


