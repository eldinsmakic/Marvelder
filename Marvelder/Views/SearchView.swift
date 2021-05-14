//
//  SearchView.swift
//  Marvelder
//
//  Created by eldin smakic on 13/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct SearchView: View {

    var listCharacter: [String] = ["Spider-Man","Spiterm","Captain"]
    @State var text = ""

    var body: some View {
        VStack {
            Text("HOME")
                .font(.title)
                .bold()
                .padding(.top, 40)
                .padding(.bottom)
            SearchBar(text: $text)
                .padding()
            List(listCharacter.filter({ str in
                str.contains(text)
            }), id: \.self ) { element in
                Text(element)
            }
        }.frame(height: UIScreen.main.bounds.size.height, alignment: .top)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
