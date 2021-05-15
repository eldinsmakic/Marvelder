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

    @State var text = ""

    func search(text: String) {
        viewModel.search(name: text)
    }

    var body: some View {
        VStack {
            Text("HOME")
                .font(.title)
                .bold()
                .padding(.top, 40)
                .padding(.bottom)
            SearchBar(text: $text, search: search)
                .padding()
            List(viewModel.characters) { character in
                CharacterCellView(character: character)
            }
        }.frame(height: UIScreen.main.bounds.size.height, alignment: .top)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
