//
//  GenericListView.swift
//  Marvelder
//
//  Created by eldin smakic on 16/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct GenericListView<T:MarvelListT, ItemDetail: View>: View {

    @State var items: MarvelList<T>

    var card: (T) -> ItemDetail

    var body: some View {
        VStack {
            HStack {
                Text("Comics")
                    .font(.title)
                    .bold()
                    .padding(.leading, 8)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                HStack(spacing: 10) {
                        ForEach(items.items!) { item in
                            card(item)
                        }
                }
            }).frame(height: 200, alignment: .center)
        }
    }
}

struct GenericListView_Previews: PreviewProvider {
    static var previews: some View {
        GenericListView(
            items: Fake.Comic.comics,
            card: {
                item in GenericCellView(
                    id: item.comicId!,
                    viewModel: ComicCellViewModel()
                )
            }
        )
    }
}
