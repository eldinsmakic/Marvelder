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
                        AsyncImage(
                            url: character.thumbnail!.url,
                            placeholder: Text("Loading ...")
                        ).frame(height: 450, alignment: .top)

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
                items: character.comics!,
                card: { item in ComicsCellViewFake() }
            )
            GenericListView(
                items: character.stories!,
                card: { item in StoryCellViewFake()}
            )

        }.edgesIgnoringSafeArea(.top)
    }
}

struct CharacterDetails_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView(character: Fake.Character.character)
    }
}

