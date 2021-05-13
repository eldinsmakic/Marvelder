//
//  ComicsCellView.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI
import Combine

final class ComicCellViewModel: ObservableObject {
    let repo = ComicCellRepositoryMarvel.shared
    @Published var comicCell = Fake.Comic.marvelComicCell
    @Published var isLoad = false
    var cancellationToken: AnyCancellable?

    public func getData(fromId id: String) {
        cancellationToken = repo.get(withId: id)
            .sink { error in
                print(error)
        } receiveValue: { data in
            self.comicCell = data
            self.isLoad = true
        }
    }
}

struct ComicsCellView: View {
    let id: String
    @ObservedObject var viewModel = ComicCellViewModel()

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
            }.frame(width: UIScreen.main.bounds.size.width - 16, height: 220, alignment: .center)
            .onAppear(perform: { viewModel.getData(fromId: id) })
    }
}

struct ComicsCellView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsCellView(id: "78503")
    }
}


