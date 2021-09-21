//
//  CharacterDetails.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct CharacterDetailsView: View {

    @State var character: MarvelCharacter

    var body: some View {
        ScrollView(.vertical) {
                VStack {
                    AsyncImageHeader(
                        url: character.thumbnail!.url,
                        placeholder: Text("Loading ...")
                    )
                    HStack {
                        Text(character.name ?? "")
                            .font(.title)
                            .bold()
                        Spacer()
                    }.padding([.bottom, .leading , .trailing], 8)

                    Text(character.description ?? "")
                        .padding([.trailing, .leading])

                }.padding(.bottom, 32)

            GenericListView(
                title: "Comics",
                items: character.comics!,
                card: { item in
                    GenericCellView(
                        id: item.ressourceId ?? "12345",
                        viewModel: ComicCellViewModel()
                    )
                }
            ).padding(.bottom, 32)

            GenericListView(
                title: "Stories",
                items: character.stories!,
                card: { item in
                    GenericCellView(
                        id: item.ressourceId ?? "12345",
                        viewModel: StoryCellViewModel()
                    )
                }
            ).padding(.bottom, 32)

            GenericListView(
                title: "Events",
                items: character.stories!,
                card: { item in
                    GenericCellView(
                        id: item.ressourceId ?? "12345",
                        viewModel: EventCellViewModel()
                    )
                }
            ).padding(.bottom, 32)

            GenericListView(
                title: "Series",
                items: character.stories!,
                card: { item in
                    GenericCellView(
                        id: item.ressourceId ?? "12345",
                        viewModel: SeriesCellViewModel()
                    )
                }
            ).padding(.bottom, 32)

        }.edgesIgnoringSafeArea(.top)
    }
}

struct CharacterDetails_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView(character: Fake.Character.character)
//        CharacterDetailsView(character: Fake.Character.character)
//            .previewDevice(PreviewDevice(rawValue: "iPad Pro (10.5-inch)"))
    }
}

