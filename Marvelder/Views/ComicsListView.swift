//
//  ComicsListView.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct ComicsListView: View {
    @State var comics: Comics
    var body: some View {
        VStack {
            HStack {
                Text("Comics").font(.title)
                    .padding(.leading, 16)
                Spacer()
            }
            VStack {
                List {
                    ForEach(comics.items) { item in
                        ComicsCellView(id: item.comicId ?? "12345")
                    }
                }
            }
        }
    }
}

struct ComicsListView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsListView(comics: .init(available: 10, items: [
            ComicsRessourceItem(ressouceURI: "http://gateway.marvel.com/v1/public/comics/62304", name: "Spider-Man: 101 Ways to End the Clone Saga (1997) #1"),
            ComicsRessourceItem(ressouceURI: "http://gateway.marvel.com/v1/public/comics/78503", name: "2099 Alpha (2019) #1"),
            ComicsRessourceItem(ressouceURI: "http://gateway.marvel.com/v1/public/comics/60151", name: "A YEAR OF MARVELS TPB (Trade Paperback)")
         ]))
    }
}

