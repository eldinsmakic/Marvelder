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

struct AsyncImageHeader<Placeholder: View>: View {

    @ObservedObject private var loader: ImageLoader

    @State var time = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect()
    @State var show = false

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
                GeometryReader { geo in
                    Image(uiImage: loader.image!)
                    .resizable()
                    .offset(y: geo.frame(in: .global).minY > 0 ? -geo.frame(in: .global).minY : 0)
                    .frame(height: geo.frame(in: .global).minY > 0 ? UIScreen.main.bounds.size.height / 2.2 + geo.frame(in: .global).minY : UIScreen.main.bounds.size.height / 2.2, alignment: .center)
                    .onReceive(self.time, perform: { _ in
                        let y = geo.frame(in: .global).minY

                        if -y > UIScreen.main.bounds.size.height / 2.2 - 50 {
                            self.show = true
                        } else {
                            self.show = false
                        }
                    })
                }.frame(height: UIScreen.main.bounds.size.height / 2.2)
            } else {
                placeholder
            }
        }
    }
}



