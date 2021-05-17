//
//  StoryCellView.swift
//  Marvelder
//
//  Created by eldin smakic on 16/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct StoryCellView: View {

    let id: String
    let useFakeData = false

    @ObservedObject private var viewModel = StoryCellViewModel()

    var body: some View {
            GeometryReader { geo in
                if viewModel.isLoad {
                    VStack {
                        Text(viewModel.storyCell.title).font(.title3)
                            .lineLimit(2)
                            .padding([.leading, .bottom, .trailing], 8)
                            .frame(height: 90, alignment: .bottom)

                        HStack {
                            AsyncImage(url: viewModel.storyCell.thumbnail?.url, placeholder: Text("Loading ..."))
                                    .frame(width: geo.size.width/3 , alignment: .center)
                            Text(viewModel.storyCell.description ?? "No description").font(.body)
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


struct StoryCellViewFake: View {

    let story = Fake.Story.storyCell

    var body: some View {
            GeometryReader { geo in
                    VStack {
                        Text(story.title).font(.title3)
                            .lineLimit(2)
                            .padding([.leading, .bottom, .trailing], 8)
                            .frame(height: 90, alignment: .bottom)
                        HStack {
                                AsyncImage(url: story.thumbnail!.url, placeholder: Text("Loading ..."))
                                    .cornerRadius(5)
                                    .clipped()
                                    .frame(width: geo.size.width/3 , alignment: .center)

                            Text(story.description ?? "No description").font(.body)
                                .padding(.trailing)
                                .frame(alignment: .bottom)
                        }
                    }
            }.frame(width: UIScreen.main.bounds.size.width - (8*2), height: 220, alignment: .center)
    }
}

struct StoryCellView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCellViewFake()
            .previewLayout(.sizeThatFits)
    }
}


