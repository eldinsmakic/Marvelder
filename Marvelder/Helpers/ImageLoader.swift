//
//  ImageLoader.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import Combine
import SwiftUI

class ImageLoader: ObservableObject {

    @Published var image: UIImage?
    @Published var isLoad = false

    private var cancellable: AnyCancellable?
    private static let imageProcessingQueue = DispatchQueue(label: "image-processing")

    private let url: URL

    init(url: URL) {
        self.url = url
    }

    deinit {
        cancellable?.cancel()
    }

    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: Self.imageProcessingQueue)
            .map {
                return UIImage(data: $0.data)
            }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { image in
                self.image = image
                self.isLoad = true
            })
    }

    func cancel() {
        cancellable?.cancel()
    }
}
