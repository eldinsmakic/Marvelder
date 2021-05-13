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
    private let url: URL

    init(url: URL) {
        self.url = url
    }

    private var cancellable: AnyCancellable?
    private static let imageProcessingQueue = DispatchQueue(label: "image-processing")
    private var disposeBag = Set<AnyCancellable>()
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
            }, receiveValue: { uiimage in
                self.image = uiimage
                self.isLoad = true
                print("fixing image")
            })
//            .assign(to: \.image, on: self)

//        cancellable?.cancel()
    }

    func cancel() {
        cancellable?.cancel()
    }
}
