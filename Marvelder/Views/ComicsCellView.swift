//
//  ComicsCellView.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct ComicsCellView: View {
    @State var comicCell: MarvelComicCell
    var body: some View {
            GeometryReader { geo in
            HStack {
                AsyncImage(url: comicCell.thumbnail!.url, placeholder: Text("Loading ..."))
                    .frame(width: geo.size.width/4, height: geo.size.height, alignment: .center)
                VStack {
                    Text(comicCell.title).font(.title3)
                        .padding(.bottom)
                    Text(comicCell.description).font(.body)
                }
            }.frame(width: .infinity, height: 200, alignment: .leading)
    }
    }
}

struct ComicsCellView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsCellView(comicCell:
                        MarvelComicCell(
                            id: 4,
                            title: "Spider-Man: 101 Ways to End the Clone Saga (1997) #1",
                            description: "Spider-Man's Clone Saga has spun completely out of control! There's only one team that can save the wall-crawler now: the Marvel editors! Bob Harras, Ralph Macchio, Tom Brevoort, and more put their heads together to see if ANYTHING can get Spidey out of this doppelganger debacle!",
                            thumbnail: MarvelImage(
                                path: "http://i.annihil.us/u/prod/marvel/i/mg/9/80/59b3104f67eaf",
                                ext: "jpg")
                        )
        )
    }
}


