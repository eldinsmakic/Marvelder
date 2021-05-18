//
//  ComicSearchCellView.swift
//  Marvelder
//
//  Created by eldin smakic on 18/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct ComicSearchCellView: View {

    let comic: MarvelComicCell

    var body: some View {
        HStack {
            AsyncImage(url: comic.thumbnail?.url, placeholder: Text("hello"))
                .cornerRadius(10)
                .frame(width: UIScreen.main.bounds.size.width/2 - (8 * 2))
            VStack {
                Text(comic.title)
                    .font(.title3)
                    .bold()
                    .padding(.bottom)

                Text(comic.description ?? "No Description")
                    .font(.body)
                    .foregroundColor(.gray)
            }
        }
        .padding([.leading, .trailing])
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.size.width/2 - (8 * 2))
    }
}

struct ComicSearchCellView_Previews: PreviewProvider {
    static var previews: some View {
        ComicSearchCellView(comic: Fake.Comic.marvelComicCell)
    }
}
