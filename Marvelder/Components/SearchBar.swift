//
//  SearchBar.swift
//  Marvelder
//
//  Created by eldin smakic on 13/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing = false

    let search: ((String) -> Void)?

    var body: some View {
        HStack {

            TextField("Search ...", text: Binding(get: { text }, set: { value in
                text = value
                search?(value)
            })
                        )
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }

            if isEditing && !text.isEmpty {
                Button(action: {
                    self.isEditing = false
                    self.text = ""

                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 12)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
        .frame(width: UIScreen.main.bounds.size.width - (8*2))
        .overlay(
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 12)

                if isEditing && !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, text.isEmpty ? 12 : 100)
                    }
                }
            }
        )
    }
}

struct SearchBar_Previews: PreviewProvider {
    @State static var text = "test"
    static var previews: some View {
        SearchBar(text: $text, search: { text in
            print(text)
        })
    }
}
