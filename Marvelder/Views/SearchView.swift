//
//  SearchView.swift
//  Marvelder
//
//  Created by eldin smakic on 13/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct SearchView: View {

    @ObservedObject private var viewModel = CharacterSearchViewModel()
    @ObservedObject private var keyboardHandler = KeyboardHandler()

    @State var text = ""

    func search(text: String) {
        viewModel.search(name: text)
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("HOME")
                    .font(.title)
                    .bold()
                    .padding(.top, 40)
                    .padding(.bottom)
                SearchBar(text: $text, search: search)
                    .padding()

                HStack {
                    Text("Characters: \(viewModel.characters.count)")
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        ForEach(viewModel.characters) { character in
                            NavigationLink(
                                destination: CharacterDetailsView(character: character),
                                label: {
                                    CharacterCellView(character: character)
                                })
                        }
                    }
                }
            )
            }.frame(height: keyboardHandler.keyboardHeight == 0 ?  UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.height - keyboardHandler.keyboardHeight, alignment: .top)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
