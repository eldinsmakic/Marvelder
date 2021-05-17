//
//  AsyncImage.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {

    @ObservedObject private var loader: ImageLoader

    private let placeholder: Placeholder?

    init(url: URL?, placeholder: Placeholder? = nil) {
        if let url = url {
            loader = ImageLoader(url: url)
        } else {
            let marvelImage = MarvelImage(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/9/80/59b3104f67eaf",
                ext: "jpg"
            )

            loader = ImageLoader(url: marvelImage.url)
        }

        self.placeholder = placeholder
    }

    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }

    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                .resizable()
                .scaledToFit()
            } else {
                placeholder
            }
        }
    }
}
