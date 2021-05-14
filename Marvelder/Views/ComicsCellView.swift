//
//  ComicsCellView.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI
import Combine

struct ComicsCellView: View {
    let id: String
    let useFakeData = true

    @ObservedObject private var viewModel = ComicCellViewModel()

    var body: some View {
            GeometryReader { geo in
                if viewModel.isLoad {
                    VStack {
                        Text(viewModel.comicCell.title).font(.title3)
                            .lineLimit(2)
                            .padding([.leading, .bottom, .trailing], 8)
                            .frame(height: 90, alignment: .bottom)

                        HStack {
                                AsyncImage(url: viewModel.comicCell.thumbnail!.url, placeholder: Text("Loading ..."))
                                    .frame(width: geo.size.width/3 , alignment: .center)
                            Text(viewModel.comicCell.description ?? "No description").font(.body)
                                .padding(.trailing)
                                .frame(alignment: .bottom)
                        }
                    }
                }
            }.frame(width: UIScreen.main.bounds.size.width - (8*2), height: 220, alignment: .center)
            .onAppear(perform: {
                if useFakeData {
                    viewModel.isLoad = true
                    viewModel.cancellationToken = nil
                } else {
                    viewModel.getData(fromId: id)
                }
            })
    }
}


struct ComicsCellViewFake: View {

    let comic = Fake.Comic.marvelComicCell

    var body: some View {
            GeometryReader { geo in
                    VStack {
                        Text(comic.title).font(.title3)
                            .lineLimit(2)
                            .padding([.leading, .bottom, .trailing], 8)
                            .frame(height: 90, alignment: .bottom)
                        HStack {
                                AsyncImage(url: comic.thumbnail!.url, placeholder: Text("Loading ..."))
                                    .cornerRadius(5)
                                    .clipped()
                                    .frame(width: geo.size.width/3 , alignment: .center)

                            Text(comic.description ?? "No description").font(.body)
                                .padding(.trailing)
                                .frame(alignment: .bottom)
                        }
                    }
            }.frame(width: UIScreen.main.bounds.size.width - (8*2), height: 220, alignment: .center)
    }
}

struct ComicsCellView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsCellViewFake()
            .previewLayout(.sizeThatFits)
    }
}


