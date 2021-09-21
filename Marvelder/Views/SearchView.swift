//
//  SearchView.swift
//  Marvelder
//
//  Created by eldin smakic on 13/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI
import Combine

final class ComicsSearchViewModel: ObservableObject {

    let repo = ComicRepositoryMarvel.shared

    @Published var comics: [MarvelComic] = []
    @Published var isLoad = false

    var cancellationToken: AnyCancellable?

    public func search(name: String) {
        cancellationToken = repo.getSearch(WithText: name)
            .sink { error in
                print(error)
        } receiveValue: { data in
            self.comics = data
            self.isLoad = true
        }
    }
}

struct SearchView: View {

    @ObservedObject private var viewModelCharacters = CharacterSearchViewModel()
    @ObservedObject private var viewModelComics = ComicsSearchViewModel()
    @ObservedObject private var keyboardHandler = KeyboardHandler()

    @State var text = ""

    func search(text: String) {
        viewModelCharacters.search(name: text)
        viewModelComics.search(name: text)
    }

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical) {
                    Text("HOME")
                        .font(.title)
                        .bold()
                        .padding(.top, 40)
                        .padding(.bottom)
                    SearchBar(text: $text, search: search)
                        .padding()

                    if (viewModelCharacters.characters.count > 0) {
                        HStack {
                            Text("Characters: \(viewModelCharacters.characters.count)")
                                .font(.title)
                                .bold()
                                .padding()
                            Spacer()
                        }

                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack {
                                ForEach(viewModelCharacters.characters) { character in
                                    NavigationLink(
                                        destination: CharacterDetailsView(character: character),
                                        label: {
                                            CharacterCellSearchView(character: character)
                                    })
                                }
                            }
                        })
                    }
    //
//                    HStack {
//                        Text("Comics: \(viewModelComics.comics.count)")
//                            .font(.title)
//                            .bold()
//                            .padding()
//                        Spacer()
//                    }
//
//                    ScrollView(.horizontal, showsIndicators: false, content: {
//                        HStack {
//                            ForEach(viewModelComics.comics) { comic in
//                                NavigationLink(
//                                    destination: Text(comic.title),
//                                    label: {
//                                        ComicSearchCellView(comic: MarvelComicCell(id: comic.id, title: comic.title, description: comic.description, thumbnail: comic.thumbnail))
//                                })
//                            }
//                        }
//                    })

                }.frame(height: keyboardHandler.keyboardHeight == 0 ?  UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.height - keyboardHandler.keyboardHeight, alignment: .top)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
//        SearchView().colorScheme(.dark)
    }
}
